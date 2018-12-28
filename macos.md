# MacOS Configuration

I use MacOS as my primary operating system for doing work and I like to configure any new machine with the following system configurations.

This file can be `mdtangle`d into `macos.bash` and then run with `bash macos.bash`.

## Setup

Close any system prefrence panes.

```sh
osascript -e 'tell application "System Preferences" to quit'
```

## Screenshots

Make sure that the folder for the screenshot path exists.

```sh
mkdir -p ~/Documents/screenshots
```

Set the location for screenshots to `~/Documents/screenshots`.

```sh
defaults write com.apple.screencapture location ~/Documents/screenshots
```

Disable the screenshot shadow.

```sh
defaults write com.apple.screencapture disable-shadow -bool TRUE
```

Set the file type to be png because the quality is better.

```sh
defaults write com.apple.screencapture type png
```

## Finder

A cluttered desktop is a cluttered mind, and an empty desk is an...nevermind.

Disable the actual Desktop from showing the files that are in the Desktop directory.

```sh
defaults write com.apple.finder CreateDesktop false
```

Display the status bar in the finder window.

```sh
defaults write com.apple.finder ShowStatusBar -bool true
```

Disable window animations and Get Info animations.

```sh
defaults write com.apple.finder DisableAllAnimations -bool true
```

Show hidden files by default.

```sh
defaults write com.apple.Finder AppleShowAllFiles -bool true
```

Show path bar in the Finder window.

```sh
defaults write com.apple.finder ShowPathbar -bool true
```

Kill Finder so changes can take effect.

```sh
killall Finder
```

## Clock

Since I prefer 24 hour time, I set the menubar clock to match 24 hour time instead of AM/PM.

```sh
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
```

## Cleanup

Make sure the changes take effect by restarting the System UI server.

```sh
killall SystemUIServer
```
