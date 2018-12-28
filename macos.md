# MacOS Configuration

I use MacOS as my primary operating system for doing work and I like to configure any new machine with the following system configurations:

This file can be `mdtangle`d into `macos.bash` and then run with `bash macos.bash`:

## Setup

Close any system prefrence panes:

```sh
osascript -e 'tell application "System Preferences" to quit'
```

## Screenshots

Make sure that the folder for the screenshot path exists:

```sh
mkdir -p ~/Documents/screenshots
```

Set the location for screenshots to `~/Documents/screenshots`:

```sh
defaults write com.apple.screencapture location ~/Documents/screenshots
```

Disable the screenshot shadow:

```sh
defaults write com.apple.screencapture disable-shadow -bool TRUE
```

Set the file type to be png because the quality is better:

```sh
defaults write com.apple.screencapture type png
```

## Finder

A cluttered desktop is a cluttered mind, and an empty desk is an...nevermind:

Disable the actual Desktop from showing the files that are in the Desktop directory:

```sh
defaults write com.apple.finder CreateDesktop false
```

Display the status bar in the finder window:

```sh
defaults write com.apple.finder ShowStatusBar -bool true
```

Disable window animations and Get Info animations:

```sh
defaults write com.apple.finder DisableAllAnimations -bool true
```

Show hidden files by default:

```sh
defaults write com.apple.Finder AppleShowAllFiles -bool true
```

Show path bar in the Finder window:

```sh
defaults write com.apple.finder ShowPathbar -bool true
```

Kill Finder so changes can take effect:

```sh
killall Finder
```

## Clock

Since I prefer 24 hour time, I set the menubar clock to match 24 hour time instead of AM/PM:

```sh
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
```

## Calendar

Show week numbers:

```sh
defaults write com.apple.iCal "Show Week Numbers" -bool true
```

Show 7 days instead of 5:

```sh
defaults write com.apple.iCal "n days of week" -int 7
```

I start my week on Monday:

```sh
defaults write com.apple.iCal "first day of week" -int 1
```

Show event times in month view:

```sh
defaults write com.apple.iCal "Show time in Month View" -bool true
```

## Dock

Remove all persistent apps from the Dock (I don't really use it for getting to applications):

```sh
defaults read com.apple.dock persistent-apps
```

Enable the 2D Dock:

```sh
defaults write com.apple.dock no-glass -bool true
```

Automatically hide and show the Dock:

```sh
defaults write com.apple.dock autohide -bool true
```

Make Dock icons of hidden applications translucent

```sh
defaults write com.apple.dock showhidden -bool true
```

Enable highlight hover effect for the grid view of a stack (Dock):

```sh
defaults write com.apple.dock mouse-over-hilte-stack -bool true
```

Enable spring loading for all Dock items:

```sh
defaults write enable-spring-load-actions-on-all-items -bool true
```

Don't show indicator lights for open applications in the Dock:

```sh
defaults write com.apple.dock show-process-indicators -bool false
```

Don’t animate opening applications from the Dock:

```sh
defaults write com.apple.dock launchanim -bool false
```

Remove all the persistent apps on the right part of the Dock:

```sh
defaults delete com.apple.dock persistent-others
```

Kill Dock so that the changes take effect:

```sh
killall Dock
```

## NSGlobalDomain (System Preferences)

Disable smart quotes as they’re annoying when typing code and almost always end in tears:

```sh
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
```

Disable smart dashes as they’re annoying when typing code and _also_ almost always end in tears:

```sh
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
```

Set the keyboard repeat rate to be super fast (1 = fastest for macOS high sierra, older versions support 0):

```sh
defaults write NSGlobalDomain KeyRepeat -int 2
```

Show all filename extensions:

```sh
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

This sets everything to Dark Mode (in MacOS Mojave), but in older versions of OSX/MacOS it just makes the menubar dark (which is what I'd prefer):

```sh
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
```

## Cleanup

Make sure the changes take effect by restarting the System UI server:

```sh
killall SystemUIServer
```
