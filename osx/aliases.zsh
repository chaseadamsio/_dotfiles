# Show/hide hidden files in Finder
alias showhddn="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehddn="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedt="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdt="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
