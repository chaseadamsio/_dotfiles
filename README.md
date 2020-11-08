# Dotfiles

These are my dotfiles. They've changed a lot over time and will likely change a lot more over time.

If you're looking at them and you're not me, feel free to use them as a guide.

## Setup

- Clone dotfiles:

```bash
mkdir -p $HOME/src/github.com/chaseadamsio
git clone git@github.com:chaseadamsio/dotfiles.git
```

- Symlink files

- Install homebrew:

```bash
#!/bin/bash
homebrew_expected_md5="546219756e1bc7a557030d9e63d2d6f0"
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install -o /tmp/homebrew.sh
homebrew_downloaded_md5="$(cat /tmp/homebrew.sh | md5 | awk '{print $1}')"
if [ "$homebrew_expected_md5" != "$homebrew_downloaded_md5" ]; then
    echo "md5 for expected homebrew install script does not match downloaded homebrew install script, exiting."
    exit 1
fi

/usr/bin/ruby -e /tmp/homebrew.sh
exit 0
```

## Set Shell

- run =brew bundle=

```bash
chsh -s $(which zsh)
```

## Installed by hand 
- Homebrew 
- Spark App (email and calendar)