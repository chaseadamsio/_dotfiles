function my_ps1_prompt() {
    if [ "$(uname -s)" == "Darwin" ]; then
        _git_prompt_loc=`brew --prefix git`/etc/bash_completion.d/git-prompt.sh
    fi

    if [ -f "$_git_prompt_loc" ]; then
        source $_git_prompt_loc
    fi

    local _RS="\033[0;0m\]"    # reset
    local _BLK="\[\033[0;30m\]" # regular black
    local _RED="\[\033[0;31m\]" # regular red
    local _GRN="\[\033[0;32m\]" # regular green
    local _BGRN="\[\033[1;32m\]" # bright green
    local _YEL="\[\033[0;33m\]" # regular yellow
    local _BLE="\033[0;34m\]" # regular blue
    local _MAG="\[\033[0;35m\]" # regular magenta
    local _CYN="\033[0;36m\]" # regular cyan
    local _WHT="\[\033[0;37m\]" # regular white
    local _git_prompt='`__git_ps1 "(%s)"`'
    PS1="$_BLE\w $_MAG$_git_prompt\n$_CYN λ $_RS"
}

my_ps1_prompt
