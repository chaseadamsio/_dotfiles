#!/bin/bash

### FUNCTIONS ###
# mkdir recursively and change into it when done:
mkd() {
    mkdir -p "$@" && cd "$@"
}

# git-branch-nuke deletes a branch locally and in the origin remote
git-branch-nuke() {
    git branch -D $1
    git push origin :$1
}
