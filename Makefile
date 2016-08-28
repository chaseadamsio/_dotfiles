.PHONY: all

CONFIG_PATH=$(CURDIR)/configs

all:
	echo "hello"

dotfiles-bootstrap:
	./scripts/symlinks ln $(CONFIG_PATH)

dotfiles-clean:
	./scripts/symlinks rm $(CONFIG_PATH)

docker-build:
	docker build -t chaseadamsio/dotfiles:latest .

docker-run:
	sudo docker run -it -v $(PWD):/data chaseadamsio/dotfiles:latest /bin/bash
