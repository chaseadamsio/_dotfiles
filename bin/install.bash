#!/bin/bash
# borrowed from JessFraz Dotfiles: https://github.com/jessfraz/dotfiles/blob/master/bin/install.sh

USER_REPOS_PATH="$HOME/src/github.com/chaseadamsio"
DOTFILES_PATH="$USER_REPOS_PATH/dotfiles"

usage () {
    echo -e "install.sh\\n\\tThis script installs my basic setup for a MacOS laptop\\n"
    echo "Usage: "
    echo "  base        - setup homebrew & install base packages"
    echo "  dotfiles    - get dotfiles"
}

base () {
    echo "running base..."
}


get_dotfiles () {
    echo "getting dotfiles..."
    test -L "$DOTFILES_PATH" || (
        mkdir -p "$USER_REPOS_PATH"
        git clone git@github.com:chaseadamsio/dotfiles.git "$DOTFILES_PATH"
        cd "$DOTFILES_PATH"
        git remote set-url origin git@github.com:chaseadamsio/dotfiles.git
        make
    )
}

main () {
    local cmd=$1

    if [[ -z "$cmd" ]]; then
        usage
        exit 1
    fi

    if [[ $cmd == "base" ]]; then
        base
    elif [[ $cmd == "dotfiles" ]]; then
        get_dotfiles
    else
        usage
    fi
}

main "$@"
