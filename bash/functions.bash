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


# https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
fromhex(){
    hex=${1#"#"}
    r=$(printf '0x%0.2s' "$hex")
    g=$(printf '0x%0.2s' ${hex#??})
    b=$(printf '0x%0.2s' ${hex#????})
    printf '%03d' "$(( (r<75?0:(r-35)/40)*6*6 +
                       (g<75?0:(g-35)/40)*6   +
                       (b<75?0:(b-35)/40)     + 16 ))"
}
