#!/bin/zsh
if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000

export GOPATH=$HOME
export WRK=$GOPATH/src
export DOTFILES=$GOPATH/src/gitlab.com/chaseadamsio/dotfiles

export PATH=/usr/local/bin:$GOPATH/bin:/usr/local/go/bin:$PATH

### CD ###
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

### LS ###
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"
alias lsd='ls -l ${colorflag} | grep "^d"'
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

### SHORTCUTS ###
alias godf="cd $DOTFILES"
alias gogl="cd $WRK/gitlab.com"
alias goglca="cd $WRK/gitlab.com/chaseadamsio"
alias goghca="cd $WRK/github.com/chaseadamsio"

alias re!=". $HOME/.zshrc"

### DOCKER ###
# stop all running docker containers:
alias dockerstopall="docker stop $(docker ps -a -q)"
# remove all running docker containers:
alias dockerrmall="docker rm $(docker ps -a -q)"
# nuke all running docker containers:
alias dockernukeall="dockerstopall && dockerrmall"

### PYTHON ###
# sane python aliases
alias python=python3
alias pip=pip3

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

### OSX ###
# Sometimes the daemon for the built-in cameras on OSX gets in a weird state and the camera no longer works. This restarts the daemon and fixes the camera issue:
alias fixcamera="sudo killall VDCAssistant"
