# dotfiles
Sensible hacker defaults for the modern gentleman.

## Usage

I decided not to symlink my bash\_profile and instead decided just to source it from the dotfiles repository.

In my ~/.bash\_profile I have the following:

```
export DOTFILES_ROOT="$HOME/bin/dotfiles"
alias dotfiles="cd $DOTFILES_ROOT"
alias dot="dotfiles"
source $DOTFILES_ROOT/bash_profile
```

My `.vimrc` is a symlink.

To setup the osx defaults, from the `dotfiles` directory on your computer, run `sh ./osx`.