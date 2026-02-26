# nix-darwin config for MacOS machines

This repository contains the flake I currently use to configure a macOS host machine with [nix-darwin](https://github.com/nix-darwin/nix-darwin).
It is thought of to be used alongside the dotfiles I track via [this](https://git.sr.ht/~niccolozanotti/.dotfiles) repository.

## Steps to set up on a fresh install

### XCode Command Line Tools

First, install Xcode Command Line Tools via
```sh
xcode-select --install
```

### Nix

Install determinate systems via package (creates the APFS partition etc…) or script. See [here](https://github.com/DeterminateSystems/nix-installer)
Clone the nix Darwin flake
```sh
cd $HOME
git clone https://git.sr.ht/~niccolozanotti/nix-darwin
```
Set computer hostname to match the one in the flake:
```sh
sudo scutil --set HostName macbook-pro14
```
and now run
```sh
sudo nix run nix-darwin -- switch --flake .#macbook-pro14
```
The following aliases are then defined in the dotfiles and come in handy:
```zsh
alias nixdarwin-rebuild='sudo darwin-rebuild switch --flake ~/nix-darwin#macbook-pro14'
alias nixedit='cd ~/nix-darwin && nvim flake.nix'
```

### Dotfiles

We now set up the [dotfiles](https://git.sr.ht/~niccolozanotti/.dotfiles):
```sh
mkdir -p ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir $HOME/.dotfiles
git clone --bare -b arm64/macOS https://git.sr.ht/~niccolozanotti/dotfiles.git $HOME/.dotfiles  
```

### Browsers

Remove Librewolf from quarantine
```
xattr -d com.apple.quarantine /Applications/LibreWolf.app
```
If saved, copy over the `.default` profiles previously backed up.

### Tmux

```sh
tmux source ~/.config/tmux/tmux.conf
```
Since it clashes with the newly mapped prefix of tmux, remove the shortcut: `ctrl+option` which on mac by default is mapped to "Change to next/previous input source”

## TODOs:

- [ ] Fix `fzf`and `tmux` inconveniences as handled in [`shell.nix`](https://git.sr.ht/~niccolozanotti/nix-darwin/tree/main/item/modules/shells.nix)
