#!/bin/bash
# borrowed from JessFraz Dotfiles: https://github.com/jessfraz/dotfiles/blob/master/bin/install.sh
set -e
set -o pipefail

USER_REPOS_PATH="$HOME/src/github.com/chaseadamsio"
DOTFILES_ROOT="$USER_REPOS_PATH/dotfiles"

usage () {
    echo -e "install.sh\\n\\tThis script installs my basic setup for a MacOS laptop\\n"
    echo "Usage: "
    echo "  packages    - install packages from homebrew"
    echo "  dotfiles    - get dotfiles"
    echo "  tools       - install homebrew"
}

base () {
    if ! hash brew 2>/dev/null; then
        echo "installing brew..."
        install_homebrew
    fi

    echo "installing dependencies from Brewfile..."
    cd "$DOTFILES_ROOT" && brew bundle
}

install_homebrew () {
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | /usr/bin/ruby
}

install_tools () {
    install_homebrew
}

get_dotfiles () {
    echo "getting dotfiles..."
    test -L "$DOTFILES_ROOT" || (
        mkdir -p "$USER_REPOS_PATH"
        git clone git@github.com:chaseadamsio/dotfiles.git "$DOTFILES_ROOT"
        cd "$DOTFILES_ROOT"
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

    cd "$DOTFILES_ROOT" && if [[ $cmd == "base" ]]; then
        base
    elif [[ $cmd == "dotfiles" ]]; then
        get_dotfiles
    elif [[ $cmd == "homebrew" ]]; then
        install_homebrew
    elif [[ $cmd == "tools" ]]; then
        install_tools
    else
        usage
    fi
}

main "$@"
