FROM opensuse:42.2

MAINTAINER Chase Adams <chasebuildssoftware@gmail.com>

LABEL Description="A docker image for running emacs as a daemon for eval of emacs lisp" Version="1.0"

RUN zypper --non-interactive update \
    && zypper --non-interactive refresh \
    && zypper --non-interactive install \
       curl \
       tar \
       make \
       gcc \
       ncurses-devel

RUN curl -O ftp://ftp.gnu.org/pub/gnu/emacs/emacs-25.1.tar.gz \
    &&  tar -zxvf emacs-25.1.tar.gz \
    && cd emacs-25.1 \
    && env CANNOT_DUMP=yes ./configure \
    && make install


ENV HUGO_VERSION 0.16
RUN curl -sSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tgz | tar -v -C /usr/local/bin -xz --strip-components 1

CMD ["/bin/sh"]
    
