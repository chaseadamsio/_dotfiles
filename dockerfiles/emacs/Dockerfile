FROM debian:buster-slim

MAINTAINER Chase Adams <chasebuildssoftware@gmail.com>

LABEL Description="A docker image for running emacs" Version="1.0"

RUN apt-get update && apt-get install -y \
	git \
	emacs

COPY screen-24bit.terminfo .
RUN tic -x screen-24bit.terminfo

ENV TERM screen-24bit
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME

CMD ["emacs"]

