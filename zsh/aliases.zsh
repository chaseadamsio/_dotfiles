#!/bin/zsh

alias re!="source ~/.zshrc"
alias l="ls -l"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"
alias lsd='ls -l ${colorflag} | grep "^d"'
alias ls="command ls ${colorflag}"

### SHORTCUTS ###
alias godf="cd $DOTFILES"
alias gogl="cd $WRK/gitlab.com"
alias gogh="cd $WRK/github.com"
alias goglca="cd $WRK/gitlab.com/chaseadamsio"
alias goghca="cd $WRK/github.com/chaseadamsio"
