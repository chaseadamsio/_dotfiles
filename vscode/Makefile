VSCODECFGDIR := $(HOME)/Library/Application\ Support/Code/User

all: ln-settings ln-keybindings ln-projects

ln-settings:
	ln -s $(PWD)/settings.json $(VSCODECFGDIR)/settings.json

ln-keybindings:
	ln -s $(PWD)/keybindings.json $(VSCODECFGDIR)/keybindings.json

ln-projects:
	ln -s $(PWD)/projects.json $(VSCODECFGDIR)/projects.json

clean:
	rm $(VSCODECFGDIR)/projects.json $(VSCODECFGDIR)/keybindings.json $(VSCODECFGDIR)/settings.json
