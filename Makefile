ln-hammerspoon:
	ln -s $(PWD)/hammerspoon $(HOME)/.hammerspoon

clean-hammerspoon:
	rm -rf $(HOME)/.hammerspoon
