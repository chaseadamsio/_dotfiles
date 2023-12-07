# Install Antibody (package manager for ZSH):
# curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

HISTSIZE=10000
SAVEHIST=10000

export GOPATH=$HOME
export WRK_PATH="$GOPATH/src"
export GH_PATH="$WRK_PATH/github.com"
export GL_PATH="$WRK_PATH/gitlab.com"
export DOTFILES_PATH="$GH_PATH/curiouslychase/dotfiles"

PATH=/usr/local/go/bin:$PATH
PATH=$GOPATH/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$DOTFILES_PATH/bin:$PATH
PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH

if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Making GPG work for git commits
GPG_TTY=$(tty)
export GPG_TTY

source <(antibody init)

setopt null_glob



alias re!="source ~/.zshrc"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias l="ls -l ${colorflag}"
alias la="ls -la ${colorflag}"
alias lsd='ls -l ${colorflag} | grep "^d"'
alias ls="command ls ${colorflag}"

alias godot="cd $DOTFILES_PATH"
alias gogl="cd $GL_PATH"
alias gogh="cd $GH_PATH"
alias goglca="cd $GL_PATH/chaseadamsio"
alias goghca="cd $GH_PATH/chaseadamsio"

# bind emacs to 24 bit TERM if available
alias emacs="TERM=xterm-24bit emacs -nw"

function dockerstopall (){
    docker stop $(docker ps -a -q);
}

function dockerrmall () {
    docker rm $(docker ps -a -f status=exited -q);
}

function dockernukeall () {
    dockerstopall && docker rm $(docker ps -a -q)
}

function mkd () {
    mkdir -p "$@" && cd "$@"
}

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle rupa/z


# bun completions
[ -s "/Users/chase/.bun/_bun" ] && source "/Users/chase/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
