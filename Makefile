VSCODECFGDIR := $(HOME)/Library/Application\ Support/Code/User
DOTFILES_ROOT := $(HOME)/src/github.com/chaseadamsio/dotfiles

init:
	test -L $(HOME)/.zshrc || ln -s $(PWD)/zsh/zshrc.zsh $(HOME)/.zshrc
	test -d $(HOME)/.hammerspoon || ln -s $(PWD)/hammerspoon $(HOME)/.hammerspoon
	test -L $(VSCODECFGDIR)/settings.json || ln -s $(PWD)/vscode/settings.json $(VSCODECFGDIR)/settings.json
	test -L $(VSCODECFGDIR)/keybindings.json || ln -s $(PWD)/vscode/keybindings.json $(VSCODECFGDIR)/keybindings.json
	test -L $(VSCODECFGDIR)/projects.json || ln -s $(PWD)/vscode/projects.json $(VSCODECFGDIR)/projects.json
	test -L $(HOME)/.ssh/config_common || ln -s $(PWD)/ssh/config_common $(HOME)/.ssh/config_common
	test -L $(HOME)/.gitconfig || ln -s $(PWD)/gitconfig $(HOME)/.gitconfig
	test -d $(HOME)/.emacs.d || ln -s $(PWD)/emacs.d $(HOME)/.emacs.d

clean:
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.hammerspoon
	rm -rf $(VSCODECFGDIR)/projects.json $(VSCODECFGDIR)/keybindings.json $(VSCODECFGDIR)/settings.json $(VSCODECFGDIR)/snippets
	rm -rf $(HOME)/.ssh/config_common
	rm -rf $(HOME)/.gitconfig
	rm -rf $(HOME)/.emacs.d