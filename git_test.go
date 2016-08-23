package main

import "testing"

type fakeGit struct {
	git
	respondsWith string
}

func (g *fakeGit) exec(args []string) error {
	return nil
}

func newFakeGit(respondsWith string) *fakeGit {
	return &fakeGit{
		respondsWith: respondsWith,
	}
}

var fork *Fork

func init() {
	fork = &Fork{
		Name:          "updateforks",
		FullName:      "chaseadamsiodownstream/updateforks",
		DefaultBranch: "master",
		UpstreamOwner: "chaseadamsio",
	}
}

func TestNewGit(t *testing.T) {
	actual := NewGit(*fork)
	expected := &git{
		fork: *fork,
	}

	if *actual != *expected {
		t.Errorf("NewGit(%v) => %v, want %v", fork, actual, expected)
	}
}

func TestClone(t *testing.T) {
	g := NewGit(*fork)
	err := g.Clone("testdir")
	if err != nil {
		t.Errorf("Clone(%v) => %v, want %v", fork, err, nil)
	}
}

func TestGenerateSSHURL(t *testing.T) {
	expected := "git@github.com:chaseadamsio/updateforks.git"
	actual := generateSSHURL("chaseadamsio", "updateforks")
	if actual != expected {
		t.Errorf("generateSSHURL() expected: %s actual: %s", expected, actual)
	}
}
