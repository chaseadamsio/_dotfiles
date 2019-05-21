osascript -e 'tell application "System Preferences" to quit'
mkdir -p ~/Documents/screenshots
defaults write com.apple.screencapture location ~/Documents/screenshots
defaults write com.apple.screencapture disable-shadow -bool TRUE
defaults write com.apple.screencapture type png
defaults write com.apple.finder CreateDesktop false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
killall Finder
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
defaults write com.apple.iCal "Show Week Numbers" -bool true
defaults write com.apple.iCal "n days of week" -int 7
defaults write com.apple.iCal "first day of week" -int 1
defaults write com.apple.iCal "Show time in Month View" -bool true
defaults read com.apple.dock persistent-apps
defaults write com.apple.dock no-glass -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock mouse-over-hilte-stack -bool true
defaults write enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock show-process-indicators -bool false
defaults write com.apple.dock launchanim -bool false
defaults delete com.apple.dock persistent-others
killall Dock
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
killall SystemUIServer
