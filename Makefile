DOTFILES_ROOT := $(HOME)/src/github.com/chaseadamsio/dotfiles

init: emacs-bootstrap zsh-bootstrap gitconfig-bootstrap hammerspoon-bootstrap ssh-bootstrap

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

clean:
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.hammerspoon
	rm -rf $(HOME)/.ssh/config
	rm -rf $(HOME)/.gitconfig
	rm -rf $(HOME)/.emacs.d

# Legacy VS Code Stuff
VSCODECFGDIR := $(HOME)/Library/Application\ Support/Code/User
link-vscode:
	test -L $(VSCODECFGDIR)/settings.json || ln -s $(PWD)/vscode/settings.json $(VSCODECFGDIR)/settings.json
	test -L $(VSCODECFGDIR)/keybindings.json || ln -s $(PWD)/vscode/keybindings.json $(VSCODECFGDIR)/keybindings.json
	test -L $(VSCODECFGDIR)/projects.json || ln -s $(PWD)/vscode/projects.json $(VSCODECFGDIR)/projects.json
clean-vscode:
	rm -rf $(VSCODECFGDIR)/projects.json $(VSCODECFGDIR)/keybindings.json $(VSCODECFGDIR)/settings.json $(VSCODECFGDIR)/snippets
