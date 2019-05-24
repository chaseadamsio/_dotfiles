#!/bin/bash

# if tput setaf 1 &> /dev/null; then
# 	tput sgr0; # reset colors
# 	bold=$(tput bold);
# 	reset=$(tput sgr0);
# 	# Solarized colors, taken from http://git.io/solarized-colors.
# 	black=$(tput setaf 16);
# 	blue=$(tput setaf 75);
# 	cyan=$(tput setaf 45);
# 	green=$(tput setaf 122);
# 	orange=$(tput setaf 166);
# 	purple=$(tput setaf 177);
# 	red=$(tput setaf 124);
# 	violet=$(tput setaf 61);
# 	white=$(tput setaf 189);
# 	yellow=$(tput setaf 136);
# else
	bold='';
	reset="\\e[0m";
	# shellcheck disable=SC2034
	black="\\e[1;30m";
	blue="\\e[1;34m";
	cyan="\\e[1;36m";
	green="\\e[1;32m";
	# shellcheck disable=SC2034
	orange="\\e[1;33m";
	# shellcheck disable=SC2034
	purple="\\e[1;35m";
	red="\\e[1;31m";
	violet="\\e[1;35m";
	white="\\e[1;37m";
	yellow="\\e[1;33m";
# fi

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${green}";
else
	hostStyle="${green}";
fi;

PS1="\\[\\033]0;\\w\\007\\]";
PS1+="\\[${blue}\\]\\n"; # newline
PS1+="\\[${userStyle}\\]\\u"; # username
PS1+="\\[${blue}\\]@";
PS1+="\\[${hostStyle}\\]${cloud}\\h"; # host
PS1+="\\[${blue}\\]:";
PS1+="\\[${purple}\\]\\w"; # working directory
PS1+=" ";
PS1+="\\[${white}\\]\$ \\[${reset}\\]"; # `$` (and reset color)
export PS1;





# PROMPT='λ %F{magenta}%~ %F{white}' # this is zsh

