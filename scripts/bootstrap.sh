#!/bin/sh

./brewinstall.sh;

create_dotfiles_symlink() {
  echo "Creating symlink for dotfiles"
  [[ -r $HOME/dotfiles ]] || ln -s $HOME/Projects/dotfiles $HOME/dotfiles
}

create_dotfiles_symlink

echo "Bootstrapping configurations..."

CONFIGURATION_FILES=(
  "tmux/tmux.conf"
  "vim/vimrc"
  "zsh/zshrc"
)

function link {
  for f in ${CONFIGURATION_FILES[@].symlink}; do
    local conf_path="$HOME/dotfiles/configurations"
    local orig="${f}.symlink"
    local sym=${f/[a-z]*\//.}

    echo "linking $HOME/$sym"
    if [ -r "$HOME/$sym" ]; then
      [[ -d ~/bootstrap.bak ]] ||  mkdir ~/bootstrap.bak
      mv "$HOME/$sym" "$HOME/bootstrap.bak/$sym"
      echo "$sym in home already, moving to ~/bootstrap.bak"
    fi

    ln -s "$conf_path/$orig" "$HOME/$sym"
    echo "creating symlink for $conf_path/$orig as $HOME/$sym"
  done
}

link

function ln_bin {
  ln -s $HOME/Projects/dotfiles/bin/tat $HOME/bin/tat
}

ln_bin
