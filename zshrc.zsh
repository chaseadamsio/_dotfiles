#!/bin/zsh
if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000

if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

export GOPATH=$HOME
export WRK=$GOPATH/src
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH
export DOTFILES=$GOPATH/src/gitlab.com/chaseadamsio/dotfiles

alias python=python3