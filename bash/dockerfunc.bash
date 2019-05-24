#!/bin/bash

# stop all running docker containers:
dockerstopall(){
    docker stop $(docker ps -a -q);
}
# remove all running docker containers:
dockerrmall () {
    docker rm $(docker ps -a -f status=exited -q);
}

# # nuke all running docker containers:
dockernukeall () {
    dockerstopall && docker rm $(docker ps -a -q)
}
