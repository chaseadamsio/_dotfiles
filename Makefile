VSCODECFGDIR := $(HOME)/Library/Application\ Support/Code/User

init:
	ln -s $(PWD)/hammerspoon $(HOME)/.hammerspoon
	ln -s $(PWD)/emacs.d $(HOME)/.emacs.d
	ln -s $(PWD)/zshrc.zsh $(HOME)/.zshrc
	ln -s $(PWD)/vscode/settings.json $(VSCODECFGDIR)/settings.json
	ln -s $(PWD)/vscode/keybindings.json $(VSCODECFGDIR)/keybindings.json
	ln -s $(PWD)/vscode/projects.json $(VSCODECFGDIR)/projects.json
	ln -s $(PWD)/vscode/snippets $(VSCODECFGDIR)/snippets
	ln -s $(PWD)/ssh_config_common $(HOME)/.ssh/config_common

clean:
	rm -rf $(HOME)/.hammerspoon
	rm -rf $(HOME)/.emacs.d
	rm -rf $(HOME)/.zshrc
	rm -rf $(VSCODECFGDIR)/projects.json $(VSCODECFGDIR)/keybindings.json $(VSCODECFGDIR)/settings.json $(VSCODECFGDIR)/snippets
	rm -rf $(HOME)/.ssh/config_common
