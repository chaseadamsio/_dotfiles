VSCODECFGDIR := $(HOME)/Library/Application\ Support/Code/User

init:
	test -d $(HOME).hammerspoon || ln -s $(PWD)/hammerspoon $(HOME)/.hammerspoon
	test -L $(HOME)/.bash_profile || ln -s $(PWD)/bashrc.bash $(HOME)/.bash_profile
	test -L $(VSCODECFGDIR)/settings.json || ln -s $(PWD)/vscode/settings.json $(VSCODECFGDIR)/settings.json
	test -L $(VSCODECFGDIR)/keybindings.json || ln -s $(PWD)/vscode/keybindings.json $(VSCODECFGDIR)/keybindings.json
	test -L $(VSCODECFGDIR)/projects.json || ln -s $(PWD)/vscode/projects.json $(VSCODECFGDIR)/projects.json
	test -d $(VSCODECFGDIR)/snippets || ln -s $(PWD)/vscode/snippets $(VSCODECFGDIR)/snippets
	test -L $(HOME)/.ssh/config_commons || ln -s $(PWD)/ssh_config_common $(HOME)/.ssh/config_common
	test -L $(HOME)/.gitconfig || ln -s $(PWD)/gitconfig $(HOME)/.gitconfig

clean:
	rm -rf $(HOME)/.hammerspoon
	rm -rf $(HOME)/.zshrc
	rm -rf $(VSCODECFGDIR)/projects.json $(VSCODECFGDIR)/keybindings.json $(VSCODECFGDIR)/settings.json $(VSCODECFGDIR)/snippets
	rm -rf $(HOME)/.ssh/config_common
	rm -rf $(HOME)/.vscode/extensions/chaseadamsio.vscode-theme-jellyfish
	rm -rf $(HOME)/.gitconfig
