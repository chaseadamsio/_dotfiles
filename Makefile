
defaults: do-macos-bash

ln-hammerspoon:
	ln -s $(PWD)/hammerspoon $(HOME)/.hammerspoon

clean-hammerspoon:
	rm -rf $(HOME)/.hammerspoon

emacs-all: ln-emacs.d tangle-emacs.d-init

ln-emacs.d:
	ln -s $(PWD)/emacs.d $(HOME)/.emacs.d

tangle-emacs.d-init:
	emacs --batch -l org --eval '(org-babel-tangle-file "emacs.d/init.org")'

clean-emacs.d:
	rm -rf $(HOME)/.emacs.d

generate-macos-bash:
	go run cmd/mdtangle/main.go --filename $(PWD)/macos.md --out $(PWD)/macos.bash

execute-macos-bash:
	chmod +x $(PWD)/macos.bash && ./macos.bash

do-macos-bash: generate-macos-bash execute-macos-bash
