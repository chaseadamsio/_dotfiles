.PHONY: all

all:
	echo "hello"

dotfiles: dotfiles-syml dotfiles-alias

dotfiles-syml:
	@for file in $(shell find $(CURDIR)/configs -name "*.syml" -not -name "*.alias.syml"); do \
		link=$$(echo ".$$(basename $$file)" | sed 's/.syml//g'); \
		sudo ln -sf $$file $(HOME)/$$link; \
	done; \

dotfiles-alias:
	@for file in $(shell find $(CURDIR)/configs -name "*.alias.syml"); do \
		link=$$(echo ".$$(basename $$file)" | sed 's/.syml//g'); \
		alias=$$(cat "$$file" | grep -Po "alias: (.*)" | sed 's/alias: //g'); \
		dir=$$(dirname $$alias); \
		mkdir -p $(HOME)/$$dir; \
		sudo ln -sf $$file $(HOME)/$$alias; \
	done; \

clean-dotfiles:
	@for file in $(shell find $(CURDIR)/configs -name "*.syml"); do \
		link=$$(echo ".$$(basename $$file)" | sed 's/.syml//g'); \
		sudo rm $(HOME)/$$link; \
	done; \

docker-build:
	docker build -t chaseadamsio/dotfiles:latest .

docker-run:
	sudo docker run -it -v $(PWD):/data chaseadamsio/dotfiles:latest /bin/bash
