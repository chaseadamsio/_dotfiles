package main

import (
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
)

type Github struct {
	URI        string
	APIVersion string
	user       string
	token      string
	Repos      Repos
}

type Repo struct {
	ID            int    `json:"id"`
	IsFork        bool   `json:"fork"`
	Repo          string `json:"name"`
	FullName      string `json:"full_name"`
	DefaultBranch string `json:"default_branch"`
	UpstreamName  string
}

type branch struct {
	Commit struct {
		SHA string `json:"sha"`
	} `json:"commit"`
}

type Repos []Repo

func (gh *Github) get(path string) ([]byte, error) {
	requestURL := gh.URI + path
	HTTPClient := new(http.Client)
	*HTTPClient = *http.DefaultClient
	req, err := http.NewRequest("GET", requestURL, nil)
	if err != nil {
		return nil, err
	}
	req.SetBasicAuth(gh.token, "")
	resp, err := HTTPClient.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	return ioutil.ReadAll(resp.Body)
}

func (gh *Github) GetRepos() error {
	fmt.Printf("Retrieving information about %s repos", gh.user)
	path := filepath.Join("/users", gh.user, "repos")
	body, err := gh.get(path)
	if err != nil {
		return err
	}

	json.Unmarshal(body, &gh.Repos)

	for idx, repo := range gh.Repos {
		if repo.IsFork {
			err = gh.GetForkUpstream(&gh.Repos[idx])
			if err != nil {
				return err
			}
		}
	}

	return nil
}

func (gh *Github) GetForkUpstream(repo *Repo) error {
	path := filepath.Join("/repos", repo.FullName)
	body, err := gh.get(path)
	if err != nil {
		return err
	}

	var repoResp struct {
		Parent struct {
			Owner struct {
				Login string `json:"login"`
			} `json:"owner"`
		} `json:"parent"`
	}

	json.Unmarshal(body, &repoResp)
	repo.UpstreamName = repoResp.Parent.Owner.Login + "/" + repo.Repo
	return nil
}

func (gh *Github) GetBranchLatestCommit(repoFullName string, branchName string) (*branch, error) {
	path := filepath.Join("/repos", repoFullName, "branches", branchName)
	body, err := gh.get(path)
	if err != nil {
		return nil, err
	}

	newBranch := new(branch)

	json.Unmarshal(body, &newBranch)
	return newBranch, nil
}

func (gh *Github) isCommitSynced(repo *Repo) (bool, error) {
	fork, err := gh.GetBranchLatestCommit(repo.FullName, repo.DefaultBranch)
	if err != nil {
		return false, err
	}

	upstream, err := gh.GetBranchLatestCommit(repo.UpstreamName, repo.DefaultBranch)
	if err != nil {
		return false, err
	}

	if &fork.Commit == &upstream.Commit {
		return true, nil
	}

	return false, nil
}

func (gh *Github) updateFork(repo *Repo) error {
	isSynced, err := gh.isCommitSynced(repo)
	if err != nil {
		return err
	}

	if isSynced {
		fmt.Printf("%s is already synced with upstream", repo.FullName)
		return nil
	}
	// Create a temporary directory
	dir, err := ioutil.TempDir("", "tmp")
	if err != nil {
		return err
	}
	defer os.Remove(dir)
	fmt.Printf("Beginning the process of updating %s in %s", repo.FullName, dir)

	// Clone the git repo into the temporary directory
	forkURL := fmt.Sprintf("git@github.com:%s.git", repo.FullName)
	err = gitExec([]string{"clone", "--depth", "1", forkURL, dir})
	if err != nil {
		return err
	}
	fmt.Printf("Cloned %s into %s", repo.FullName, dir)

	// Change into the temporary directcory
	err = os.Chdir(dir)
	if err != nil {
		return err
	}

	upstreamURL := fmt.Sprintf("git@github.com:%s.git", repo.UpstreamName)
	err = gitExec([]string{"remote", "add", "upstream", upstreamURL})
	if err != nil {
		return err
	}
	fmt.Printf("Added upstream remote for %s", repo.UpstreamName)

	err = gitExec([]string{"remote", "-v", "update", "-p"})
	if err != nil {
		return err
	}
	fmt.Printf("Updated remote for upstream %s", repo.UpstreamName)

	upstream := fmt.Sprintf("upstream/%s", repo.DefaultBranch)
	err = gitExec([]string{"rebase", upstream})
	if err != nil {
		return err
	}
	fmt.Printf("Rebased off of upstream %s", repo.UpstreamName)

	err = gitExec([]string{"push", "origin", repo.DefaultBranch})
	if err != nil {
		return err
	}
	fmt.Printf("Pushed %s origin/%s", repo.FullName, repo.DefaultBranch)
	return nil
}

func (gh *Github) updateForks() error {
	for idx, repo := range gh.Repos {
		if !repo.IsFork {
			continue
		}

		err := gh.updateFork(&gh.Repos[idx])
		if err != nil {
			return err
		}
	}

	return nil
}

func gitExec(args []string) error {
	cmd := exec.Command("git", args...)
	output, err := cmd.CombinedOutput()
	if err != nil {
		return err
	}
	if len(output) > 0 {
		fmt.Println(string(output))
	}
	return nil
}

func main() {
	var (
		uri        = flag.String("uri", "https://api.github.com", "The Github URI to update forks on")
		apiVersion = flag.String("api-version", "v3", "The API version for the Github uri to update forks on")
		user       = flag.String("user", "", "The GIthub user to update forks on")
		token      = flag.String("token", "", "The github user token to update fork on")
	)

	flag.Parse()

	if *user == "" {
		fmt.Println(errors.New("You must provide a user with the --user flag to use updateforks"))
		os.Exit(1)
	}

	if *token == "" {
		if os.Getenv("GITHUB_TOKEN") == "" {
			fmt.Println(errors.New("You must provide a token with the --token flag or set a GITHUB_TOKEN environment variable to use updateforks"))
			os.Exit(1)
		}

		*token = os.Getenv("GITHUB_TOKEN")
	}

	gh := &Github{
		URI:        *uri,
		APIVersion: *apiVersion,
		user:       *user,
		token:      *token,
	}

	err := gh.GetRepos()
	if err != nil {
		fmt.Println(os.Stderr, err)
		os.Exit(1)
	}

	err = gh.updateForks()
	if err != nil {
		fmt.Println(os.Stderr, err)
		os.Exit(1)
	}

	fmt.Println("All forks have been updated.")
}
