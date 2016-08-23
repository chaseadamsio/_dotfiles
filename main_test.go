package main

import (
	"encoding/json"
	"fmt"
	"reflect"
	"strings"
	"testing"

	"github.com/google/go-github/github"
)

type FakeRepositories struct {
	respondsWith string
}

var jsonResponse = `
		[{
			"name": "updateforks",
			"full_name": "chaseadamsiodownstream/updateforks",
			"owner": {
				"login": "chaseadamsiodownstream"
			},
			"default_branch": "master",
			"parent": {
				"owner": {
					"login": "chaseadamsio"
				}
			}
		}]
		`
var expectedRepositories = []*github.Repository{}

func init() {
	json.Unmarshal([]byte(jsonResponse), &expectedRepositories)
}

func (f *FakeRepositories) List(s string, lo *github.RepositoryListOptions) ([]*github.Repository, *github.Response, error) {
	var err error
	var repos []*github.Repository

	switch f.respondsWith {
	case "listError":
		repos = nil
		err = fmt.Errorf("listError")
	case "success":
		repos = expectedRepositories
		err = nil
	}
	return repos, nil, err
}

func (f *FakeRepositories) Get(user string, repo string) (*github.Repository, *github.Response, error) {
	var err error
	var expectedRepo *github.Repository

	switch f.respondsWith {
	case "getError":
		expectedRepo = nil
		err = fmt.Errorf("getError")
	case "success":
		expectedRepo = expectedRepositories[0]
		err = nil
	}
	return expectedRepo, nil, err
}

func (f *FakeRepositories) GetBranch(user string, repo string, branch string) (*github.Branch, *github.Response, error) {
	var err error
	var expectedBranch *github.Branch
	var sha string

	switch f.respondsWith {
	case "getBranchError":
		sha = ""
		err = fmt.Errorf("getBranchError")
	case "getUpstreamBranchError":
		if user == "chaseadamsiodownstream" {
			sha = "c52f25f54838f1052ed9418b65250b422c108926"
		} else {
			sha = ""
			err = fmt.Errorf("getBranchError")
		}
	case "success":
		sha = "c52f25f54838f1052ed9418b65250b422c108926"
		err = nil
	case "successUpToDate":
		if user == "chaseadamsio" {
			sha = "c52f25f54838f1052ed9418b65250b422c108926"
		} else if user == "chaseadamsiodownstream" {
			sha = "c52f25f54838f1052ed9418b65250b422c108926"
		}
		err = nil
	case "successNotUpToDate":
		if user == "chaseadamsio" {
			sha = "c52f25f54838f1052ed9418b65250b422c108926"
		} else if user == "chaseadamsiodownstream" {
			sha = "1da994835c2c720b9666e646f48c78856141acb0"
		}
		err = nil
	}
	expectedBranch = &github.Branch{
		Commit: &github.Commit{
			SHA: &sha,
		},
	}
	return expectedBranch, nil, err
}

func NewFakeRepositories(respondsWith string) *FakeRepositories {
	return &FakeRepositories{
		respondsWith: respondsWith,
	}
}

func TestGetAllRepositories(t *testing.T) {
	testCases := []struct {
		fr                  *FakeRepositories
		expected            []*github.Repository
		expectedErrContains string
	}{
		{NewFakeRepositories("listError"), nil, "could not list repositories"},
		{NewFakeRepositories("success"), expectedRepositories, ""},
	}

	for _, tc := range testCases {
		actual, actualErr := getAllRepositories(tc.fr)
		if !reflect.DeepEqual(tc.expected, actual) {
			t.Errorf("deepequal getAllRepositories() expected: %s actual: %s", tc.expected, actual)
		}

		if actualErr != nil {
			if !strings.Contains(actualErr.Error(), tc.expectedErrContains) {
				t.Errorf("err getAllRepositories() expected: %s actual: %s", tc.expectedErrContains, actualErr)
			}
		}
	}
}

func TestUpdateForkUpstream(t *testing.T) {
	fork := &Fork{
		Name:          *expectedRepositories[0].Name,
		FullName:      *expectedRepositories[0].FullName,
		Owner:         *expectedRepositories[0].Owner.Login,
		DefaultBranch: *expectedRepositories[0].DefaultBranch,
	}

	expectedFork := *fork
	expectedFork.UpstreamOwner = "chaseadamsio"

	testCases := []struct {
		fr                  *FakeRepositories
		fork                *Fork
		expected            *Fork
		expectedErrContains string
	}{
		{NewFakeRepositories("getError"), &Fork{}, &Fork{}, "could not get repository"},
		{NewFakeRepositories("success"), fork, &expectedFork, ""},
	}

	for _, tc := range testCases {
		actualErr := updateForkUpstream(tc.fr, tc.fork)
		if !reflect.DeepEqual(tc.expected, tc.fork) {
			t.Errorf("deepequal getAllRepositories() expected: %s actual: %s", tc.expected, tc.fork)
		}

		if actualErr != nil {
			if !strings.Contains(actualErr.Error(), tc.expectedErrContains) {
				t.Errorf("err getAllRepositories() expected: %s actual: %s", tc.expectedErrContains, actualErr)
			}
		}
	}
}

func TestGetBranchSHA(t *testing.T) {
	testCases := []struct {
		fr                  *FakeRepositories
		expectedSHA         string
		expectedErrContains string
	}{
		{NewFakeRepositories("getBranchError"), "", "could not get fork branch"},
		{NewFakeRepositories("success"), "c52f25f54838f1052ed9418b65250b422c108926", ""},
	}

	for _, tc := range testCases {
		actualSHA, actualErr := getBranchSHA(tc.fr, "chaseadamsio", "updateforks", "master")
		if actualSHA != tc.expectedSHA {
			t.Errorf("SHA response for getBranchSHA() expected: %s actual: %s", tc.expectedSHA, actualSHA)
		}

		if actualErr != nil {
			if !strings.Contains(actualErr.Error(), tc.expectedErrContains) {
				t.Errorf("err getAllRepositories() expected: %s actual: %s", tc.expectedErrContains, actualErr)
			}
		}
	}
}

func TestIsForkUpToDateWithUpstream(t *testing.T) {
	fork := &Fork{
		Name:          *expectedRepositories[0].Name,
		FullName:      *expectedRepositories[0].FullName,
		Owner:         *expectedRepositories[0].Owner.Login,
		DefaultBranch: *expectedRepositories[0].DefaultBranch,
		UpstreamOwner: "chaseadamsio",
	}

	testCases := []struct {
		fr                  *FakeRepositories
		fork                Fork
		expectedUpToDate    bool
		expectedErrContains string
	}{
		{NewFakeRepositories("getBranchError"), *fork, false, "could not get fork branch SHA"},
		{NewFakeRepositories("getUpstreamBranchError"), *fork, false, "could not get upstream branch SHA"},
		{NewFakeRepositories("successUpToDate"), *fork, true, ""},
		{NewFakeRepositories("successNotUpToDate"), *fork, false, ""},
	}

	for _, tc := range testCases {
		actualUpToDate, actualErr := isForkUpToDateWithUpstream(tc.fr, tc.fork)
		if actualUpToDate != tc.expectedUpToDate {
			t.Errorf("isForkUpToDateWithUpstream() expected: %b actual: %b", tc.expectedUpToDate, actualUpToDate)
		}

		if actualErr != nil {
			if !strings.Contains(actualErr.Error(), tc.expectedErrContains) {
				t.Errorf("err getAllRepositories() expected: %s actual: %s", tc.expectedErrContains, actualErr)
			}
		}
	}
}
