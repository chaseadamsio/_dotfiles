# close any System Preferences panes
osascript -e 'tell application "System Preferences" to quit'

# setup screenshots folder for later
mkdir -p ~/Documents/screenshots

### SCREENSHOTS ###
# set screenshot location
defaults write com.apple.screencapture location ~/Documents/screenshots;
# disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool TRUE;
# set type to png
defaults write com.apple.screencapture type png

### DESKTOP ###
# keep the desktop clean even if there are files in the Desktop dir
defaults write com.apple.finder CreateDesktop false

### FINDER ###
# display the status bar in the finder window
defaults write com.apple.finder ShowStatusBar -bool true

### DOCK ###
# autohide dock
defaults write com.apple.dock autohide -bool true

# kill OSX services so all of the previous changes can take effect
  killall SystemUIServer
  killall Finder