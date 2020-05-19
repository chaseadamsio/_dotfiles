DOTFILES_ROOT := $(HOME)/src/github.com/chaseadamsio/dotfiles

init: emacs-bootstrap zsh-bootstrap gitconfig-bootstrap hammerspoon-bootstrap ssh-bootstrap zk-bootstrap

emacs-bootstrap:
	mkdir -p ~/.emacs.d && emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$(DOTFILES_ROOT)/emacs/bootstrap.org")'

zsh-bootstrap:
	emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$(DOTFILES_ROOT)/zsh.org")'

gitconfig-bootstrap:
	emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$(DOTFILES_ROOT)/gitconfig.org")'

hammerspoon-bootstrap:
	mkdir -p ~/.hammerspoon && emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$(DOTFILES_ROOT)/hammerspoon.org")'

ssh-bootstrap:
	mkdir -p ~/.ssh && emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$(DOTFILES_ROOT)/ssh.org")'

zk-bootstrap:
	cd cmd/zk && cargo install --path .

clean:
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.hammerspoon
	rm -rf $(HOME)/.ssh/config
	rm -rf $(HOME)/.gitconfig
	rm -rf $(HOME)/.emacs.d/init.el
