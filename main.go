package main

import (
	"errors"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"

	"golang.org/x/oauth2"

	"github.com/google/go-github/github"
)

const (
	version = "1.0.0"
)

var client *github.Client

type Fork struct {
	Name          string
	FullName      string
	Owner         string
	DefaultBranch string
	UpstreamOwner string
}

func init() {
	var (
		token = flag.String("token", "", "The github user token to update fork on")
	)

	flag.Parse()

	if *token == "" {
		if os.Getenv("GITHUB_TOKEN") == "" {
			fmt.Println(errors.New("You must provide a token with the --token flag or set a GITHUB_TOKEN environment variable to use updateforks"))
			os.Exit(1)
		}

		*token = os.Getenv("GITHUB_TOKEN")
	}

	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: *token},
	)
	tc := oauth2.NewClient(oauth2.NoContext, ts)

	client = github.NewClient(tc)
}

type Repositories interface {
	List(string, *github.RepositoryListOptions) ([]*github.Repository, *github.Response, error)
	Get(string, string) (*github.Repository, *github.Response, error)
	GetBranch(string, string, string) (*github.Branch, *github.Response, error)
}

func getAllRepositories(r Repositories) ([]*github.Repository, error) {
	repos, _, err := r.List("", nil)
	if err != nil {
		return nil, fmt.Errorf("could not list repositories: %v", err)
	}
	return repos, nil
}

func updateForkUpstream(r Repositories, f *Fork) error {
	found, _, err := r.Get(f.Owner, f.Name)
	if err != nil {
		return fmt.Errorf("error getting repository: %s", err)
	}
	f.UpstreamOwner = *found.Parent.Owner.Login
	return nil
}

func getBranchSHA(r Repositories, owner, name, branch string) (string, error) {
	found, _, err := r.GetBranch(owner, name, branch)
	if err != nil {
		return "", fmt.Errorf("error getting fork branch: %s", err)
	}
	return *found.Commit.SHA, nil
}

func isForkUpToDateWithUpstream(r Repositories, f Fork) (bool, error) {
	forkSHA, err := getBranchSHA(r, f.Owner, f.Name, f.DefaultBranch)
	if err != nil {
		return false, fmt.Errorf("error getting fork branch: %s", err)
	}

	upstreamSHA, err := getBranchSHA(r, f.UpstreamOwner, f.Name, f.DefaultBranch)
	if err != nil {
		return false, fmt.Errorf("error getting upstream branch: %s", err)
	}

	if forkSHA == upstreamSHA {
		return true, nil
	}

	return false, nil
}

func gitexec(args []string) error {
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

func generateSSHURL(owner, name string) string {
	return "git@github.com:" + owner + "/" + name + ".git"
}

func Clone(f Fork, dir string) error {
	cloneSSHURL := generateSSHURL(f.Owner, f.Name)
	return gitexec([]string{"clone", "--depth", "1", cloneSSHURL, dir})
}

func AddUpstream(f Fork) error {
	upstreamSSHURL := generateSSHURL(f.UpstreamOwner, f.Name)
	return gitexec([]string{"remote", "add", "upstream", upstreamSSHURL})
}

func UpdateRemotes() error {
	return gitexec([]string{"remote", "-v", "update", "-p"})
}
func RebaseForkFromUpstream(f Fork) error {
	return gitexec([]string{"rebase", "upstream/" + f.DefaultBranch})
}

func PushFork(f Fork) error {
	return gitexec([]string{"push", "origin", f.DefaultBranch})
}

func updateFork(fork Fork, dir string) error {
	var err error
	err = Clone(fork, dir)
	if err != nil {
		return fmt.Errorf("could not clone fork %s: %v", fork.FullName, err)
	}

	err = os.Chdir(dir)
	if err != nil {
		return fmt.Errorf("could not change dir: %s", err)
	}

	err = AddUpstream(fork)
	if err != nil {
		return fmt.Errorf("could not add upstream url for %s: %v", fork.FullName, err)
	}

	err = UpdateRemotes()
	if err != nil {
		return fmt.Errorf("could not update remote: %s", err)
	}

	err = RebaseForkFromUpstream(fork)
	if err != nil {
		return fmt.Errorf("could not rebase fork from upstream: %s", err)
	}

	err = PushFork(fork)
	if err != nil {
		return fmt.Errorf("could not push to remote: %s", err)
	}

	return nil

}
func main() {

	repos, err := getAllRepositories(client.Repositories)
	if err != nil {
		fmt.Errorf("could not get all repositories: %s", err)
		os.Exit(1)
	}

	forks := new([]Fork)

	for _, repo := range repos {
		if !*repo.Fork {
			continue
		}
		fork := &Fork{
			Name:          *repo.Name,
			FullName:      *repo.FullName,
			Owner:         *repo.Owner.Login,
			DefaultBranch: *repo.DefaultBranch,
		}

		updateForkUpstream(client.Repositories, fork)
		if err != nil {
			log.Printf("could not get fork upstream for %s: %v", fork.Name, err)
			continue
		}

		*forks = append(*forks, *fork)
	}

	for _, fork := range *forks {
		upToDate, err := isForkUpToDateWithUpstream(client.Repositories, fork)

		if upToDate {
			continue
		}

		fmt.Println(fork.Name, ":", fork.Owner, "commit does not match", fork.UpstreamOwner, "commit")

		dir, err := ioutil.TempDir("", "tmp")
		if err != nil {
			fmt.Errorf("could not create a temporary directory: %s", err)
			os.Exit(1)
		}
		defer os.RemoveAll(dir)

		err = updateFork(fork, dir)
		if err != nil {
			fmt.Println("could not update fork %s: %v", fork.Name, err)
			os.Exit(1)
		}

	}
}
