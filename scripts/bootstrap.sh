create_dotfiles_symlink() {
  echo "Creating symlink for dotfiles"
  [[ -r $HOME/dotfiles ]] || ln -s $HOME/Projects/dotfiles $HOME/dotfiles
}

create_dotfiles_symlink

echo "Bootstrapping configurations..."

FILES=(
  ".vimrc"
  ".zshrc"
)

for f in ${FILES[@]}; do
  if [ -r "$HOME/${f}" ]; then
    [[ -d ~/bootstrap.bak ]] ||  mkdir ~/bootstrap.bak
    mv "$HOME/${f}" "$HOME/bootstrap.bak/${f}"
    echo "$f is in home already, moving to ~/bootstrap.bak"
    ln -s $HOME/dotfiles/configurations/$f $HOME/$f
    echo "creating symlink for $f in ~"
  fi
done


