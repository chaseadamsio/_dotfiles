
defaults: \
	defaults-Calendar \
	defaults-Dock \
	defaults-Finder \
	defaults-NSGlobalDomain
	# close any System Preferences panes
	osascript -e 'tell application "System Preferences" to quit'
	mkdir -p ~/Documents/screenshots # setup screenshots folder for later
	### SCREENSHOTS ###
	# set screenshot location
	defaults write com.apple.screencapture location ~/Documents/screenshots;
	# disable screenshot shadow
	defaults write com.apple.screencapture disable-shadow -bool TRUE;
	# set type to png
	defaults write com.apple.screencapture type png
	### MISC ###
	# set menubar clock to prefered 24 hr time
	defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
	# restart OSX services
	killall SystemUIServer

defaults-Finder:
	# keep the desktop clean even if there are files in the Desktop dir
	defaults write com.apple.finder CreateDesktop false
	# display the status bar in the finder window
	defaults write com.apple.finder ShowStatusBar -bool true
	# Finder: disable window animations and Get Info animations
	defaults write com.apple.finder DisableAllAnimations -bool true
	# Finder: show hidden files by default
	defaults write com.apple.Finder AppleShowAllFiles -bool true
	# Finder: show path bar
	defaults write com.apple.finder ShowPathbar -bool true
	killall Finder

defaults-NSGlobalDomain:
	# Disable smart quotes as they’re annoying when typing code
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
	# Disable smart dashes as they’re annoying when typing code
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
	# Set a blazingly fast keyboard repeat rate (1 = fastest for macOS high sierra, older versions support 0)
	defaults write NSGlobalDomain KeyRepeat -int 2
	# Finder: show all filename extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	# Dark Menubar and dock but not everything else
	defaults write -g NSRequiresAquaSystemAppearance -bool true



defaults-Dock:
	# Enable the 2D Dock
	defaults write com.apple.dock no-glass -bool true
	# Automatically hide and show the Dock
	defaults write com.apple.dock autohide -bool true
	# Make Dock icons of hidden applications translucent
	defaults write com.apple.dock showhidden -bool true
	# Enable highlight hover effect for the grid view of a stack (Dock)
	defaults write com.apple.dock mouse-over-hilte-stack -bool true
	# Enable spring loading for all Dock items
	defaults write enable-spring-load-actions-on-all-items -bool true
	# Show indicator lights for open applications in the Dock
	defaults write com.apple.dock show-process-indicators -bool true
	# Don’t animate opening applications from the Dock
	defaults write com.apple.dock launchanim -bool false
	# empty the dock of any pre-defined apps
	defaults read com.apple.dock persistent-apps
	# clean up right side (persistent)
	defaults delete com.apple.dock persistent-others
	killall Dock

defaults-Calendar:
	# Show week numbers (10.8 only)
	defaults write com.apple.iCal "Show Week Numbers" -bool true
	# Show 7 days
	defaults write com.apple.iCal "n days of week" -int 7
	# Week starts on monday
	defaults write com.apple.iCal "first day of week" -int 1
	# Show event times
	defaults write com.apple.iCal "Show time in Month View" -bool true

ln-osx-scripts:
	mkdir -p $(HOME)/Library && ln -s $(PWD)/osx-scripts $(HOME)/Library/Script\ Libraries

ln-hammerspoon:
	ln -s $(PWD)/hammerspoon $(HOME)/.hammerspoon

clean-hammerspoon:
	rm -rf $(HOME)/.hammerspoon

emacs-all: ln-emacs.d tangle-emacs.d-init

ln-emacs.d:
	ln -s $(PWD)/emacs.d $(HOME)/.emacs.d

tangle-emacs.d-init:
	emacs --batch -l org --eval '(org-babel-tangle-file "emacs.d/init.org")'

clean-emacs.d:
	rm -rf $(HOME)/.emacs.d
