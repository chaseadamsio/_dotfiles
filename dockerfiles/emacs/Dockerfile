# docker container run -it -v $HOME/.emacs.d:/home/emacs/.emacs.d emacs
FROM debian:buster-slim

MAINTAINER Chase Adams <realchaseadams@gmail.com>

LABEL Description="A docker image for running emacs" Version="1.0"

RUN apt-get update && apt-get install -y \
	git \
	emacs

COPY screen-24bit.terminfo .
RUN tic -x screen-24bit.terminfo

ENV TERM screen-24bit
ENV HOME /home/emacs
RUN useradd --create-home --home-dir $HOME emacs \
	&& chown -R emacs:emacs $HOME

CMD ["emacs"]
