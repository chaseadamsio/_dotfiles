#!/bin/zsh

# stop all running docker containers:
function dockerstopall (){
    docker stop $(docker ps -a -q);
}
# remove all running docker containers:
function dockerrmall () {
    docker rm $(docker ps -a -f status=exited -q);
}

# # nuke all running docker containers:
function dockernukeall () {
    dockerstopall && docker rm $(docker ps -a -q)
}


### FUNCTIONS ###
# mkdir recursively and change into it when done:
function mkd () {
    mkdir -p "$@" && cd "$@"
}
