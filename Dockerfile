FROM opensuse:leap

RUN zypper --non-interactive update && zypper --non-interactive install \
	which \
	make \
	vim \
	sudo \
	curl \
	tar \
