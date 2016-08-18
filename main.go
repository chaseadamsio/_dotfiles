package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
)

type Github struct {
	URI        string
	APIVersion string
}

type Repo struct {
	ID            int    `json:"id"`
	IsFork        bool   `json:"fork"`
	Repo          string `json:"name"`
	FullName      string `json:"full_name"`
	DefaultBranch string `json:"default_branch"`
	UpstreamName  string
	Parent        struct {
		Owner struct {
			Login string `json:"login"`
		} `json:"owner"`
	} `json:"parent"`
}

type Repos []*Repo

func (gh *Github) get(path string) ([]byte, error) {
	HTTPClient := new(http.Client)
	*HTTPClient = *http.DefaultClient
	req, err := http.NewRequest("GET", gh.URI+path, nil)
	if err != nil {
		return nil, err
	}
	req.SetBasicAuth(os.Getenv("GITHUB_TOKEN"), "")
	resp, err := HTTPClient.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	return ioutil.ReadAll(resp.Body)
}

func (gh *Github) GetRepos(user string) ([]*Repo, error) {
	path := filepath.Join("/users", user, "repos")
	body, err := gh.get(path)
	if err != nil {
		return nil, err
	}

	repos := Repos{}

	json.Unmarshal(body, &repos)

	for _, repo := range repos {
		if repo.IsFork {
			repo, err = gh.GetForkUpstream(repo)
			if err != nil {
				return nil, err
			}
		}
	}

	return repos, nil
}

func (gh *Github) GetForkUpstream(repo *Repo) (*Repo, error) {
	path := filepath.Join("/repos", repo.FullName)
	body, err := gh.get(path)
	if err != nil {
		return nil, err
	}

	var repoResp Repo
	json.Unmarshal(body, &repoResp)
	repo.UpstreamName = repoResp.Parent.Owner.Login + "/" + repo.Repo
	return repo, nil
}

func updateFork(repo *Repo) error {
	// Create a temporary directory
	dir, err := ioutil.TempDir("", "tmp")
	if err != nil {
		return err
	}
	defer os.RemoveAll(dir)

	// Clone the git repo into the temporary directory
	forkURL := fmt.Sprintf("git@github.com:%s.git", repo.FullName)
	err = gitExec([]string{"clone", "--depth", "1", forkURL, dir})
	if err != nil {
		return err
	}
	log.Printf("Cloned %s into %s", repo.FullName, dir)

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
	log.Printf("Added upstream remote for %s", repo.UpstreamName)

	err = gitExec([]string{"remote", "-v", "update", "-p"})
	if err != nil {
		return err
	}
	log.Printf("Updated remote for upstream %s", repo.UpstreamName)

	err = gitExec([]string{"remote", "-v", "update", "-p"})
	if err != nil {
		return err
	}
	log.Printf("Updated remote for upstream %s", repo.UpstreamName)

	upstream := fmt.Sprintf("upstream/%s", repo.DefaultBranch)
	err = gitExec([]string{"rebase", upstream})
	if err != nil {
		return err
	}
	log.Printf("Rebased off of upstream %s", repo.UpstreamName)

	err = gitExec([]string{"push", "origin", repo.DefaultBranch})
	if err != nil {
		return err
	}
	log.Printf("Pushed %s origin/%s", repo.FullName, repo.DefaultBranch)
	return nil
}

func gitExec(args []string) error {
	cmd := exec.Command("git", args...)
	output, err := cmd.CombinedOutput()
	if err != nil {
		log.Println(err)
		return err
	}
	if len(output) > 0 {
		log.Println("[git]", "[", args[0], "]", string(output))
	}
	return nil
}

func updateForks(repos []*Repo) error {
	for _, repo := range repos {
		if !repo.IsFork {
			continue
		}

		updateFork(repo)
	}

	return nil
}

func main() {
	var (
		uri        = flag.String("uri", "https://api.github.com", "The Github URI to update forks on")
		apiVersion = flag.String("api-version", "v3", "The API version for the Github uri to update forks on")
		user       = flag.String("user", "", "The GIthub user to update forks on")
	)

	flag.Parse()

	if *user == "" {
		log.Println("You must provide a user with the --user flag to use updateforks")
		return
	}

	gh := &Github{
		URI:        *uri,
		APIVersion: *apiVersion,
	}

	repos := Repos{}

	repos, err := gh.GetRepos(*user)

	if err != nil {
		log.Println(err)
		return
	}

	err = updateForks(repos)
	if err != nil {
		log.Println(err)
		return
	}

	log.Println("All forks have been updated.")
}
