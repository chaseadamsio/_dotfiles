package main

import (
	"fmt"
	"os"
	"os/exec"
)

type Cmd interface {
	exec([]string) error
	New(Fork) *git
}

type git struct {
	fork Fork
}

func NewGit(f Fork) *git {
	return &git{
		fork: f,
	}
}

func (g *git) exec(args []string) error {
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

func (g *git) Clone(dir string) error {
	cloneSSHURL := generateSSHURL(g.fork.Owner, g.fork.Name)
	return g.exec([]string{"clone", "--depth", "1", cloneSSHURL, dir})
}

func (g *git) AddUpstream() error {
	upstreamSSHURL := generateSSHURL(g.fork.UpstreamOwner, g.fork.Name)
	return g.exec([]string{"remote", "add", "upstream", upstreamSSHURL})
}

func (g *git) UpdateRemotes() error {
	return g.exec([]string{"remote", "-v", "update", "-p"})
}
func (g *git) RebaseForkFromUpstream() error {
	return g.exec([]string{"rebase", "upstream/" + g.fork.DefaultBranch})
}

func (g *git) PushFork() error {
	return g.exec([]string{"push", "origin", g.fork.DefaultBranch})
}

func (g *git) UpdateFork(dir string) error {
	var err error
	err = g.Clone(dir)
	if err != nil {
		return fmt.Errorf("could not clone fork %s: %v", g.fork.FullName, err)
	}

	err = os.Chdir(dir)
	if err != nil {
		return fmt.Errorf("could not change dir: %s", err)
	}

	err = g.AddUpstream()
	if err != nil {
		return fmt.Errorf("could not add upstream url for %s: %v", g.fork.FullName, err)
	}

	err = g.UpdateRemotes()
	if err != nil {
		return fmt.Errorf("could not update remote: %s", err)
	}

	err = g.RebaseForkFromUpstream()
	if err != nil {
		return fmt.Errorf("could not rebase fork from upstream: %s", err)
	}

	err = g.PushFork()
	if err != nil {
		return fmt.Errorf("could not push to remote: %s", err)
	}

	return nil
}

func generateSSHURL(owner, name string) string {
	return "git@github.com:" + owner + "/" + name + ".git"
}
