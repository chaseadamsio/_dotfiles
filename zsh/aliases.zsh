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
alias godot="cd $DOTFILES_PATH"
alias gogl="cd $GL_PATH"
alias gogh="cd $GH_PATH"
alias goglca="cd $GL_PATH/chaseadamsio"
alias goghca="cd $GH_PATH/chaseadamsio"
