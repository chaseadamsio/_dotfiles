#!/bin/bash
# USAGE
# In .bash_profile and .bashrc add the following lines:
#   export DOTFILES_ROOT="$HOME/[PATH TO DOTFILES DIRECTORY]"
#   source $DOTFILES_ROOT/bash_profile
# This file is a thin bootstrap to source all the other dotfiles

# For shell scripting unique to each particular box
if [ -f $HOME/bin/.localrc ]; then
  source "$HOME/bin/.localrc"
fi

# Load the shell dotfiles, and then some
for file in $DOTFILES_ROOT/{bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Source prompt and completion scripts for git
for file in ~/bin/{.git-prompt.sh,git-completion.bash}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Load RVM function
if [ -f $HOME/.rvm/scripts/rvm ]; then
  [[ -r "$HOME/.rvm/scripts/rvm" ]] && [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
fi
