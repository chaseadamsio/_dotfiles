# updateforks

This is based off of [@jfrazelle's](https://github.com/jfrazelle) awesome [updateforks](https://github.com/jfrazelle/dotfiles/blob/master/bin/updateforks) from her Dotfiles. I wanted to practice my Golang, so I took inspiration from her bash script and wrote it with stdlib go.

_Right now this only works for github, but in the future it could work for gitlab and bitbucket)_

Update forks does the following:

- grabs your remote repositories from github
- determines the forks
- clones them to a temporary directory
- adds a remote for the upstream
- updates the remote for the upstream
- rebases master of the fork from the master in upstraem
- pushes it to the upstraem
- deletes the temporary diretory
