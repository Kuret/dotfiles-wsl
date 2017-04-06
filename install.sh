#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Tmux + Plugin manager
sudo pacman -S tmux --noconfirm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# xclip for nvim clipboard integration
sudo pacman -S xclip --noconfirm

# Neovim + plugins
sudo pacman -S neovim --noconfirm
sudo pacman -S python2-neovim python-neovim --noconfirm
yaourt -S ruby-neovim --noconfirm

# Fish + Fisherman + Theme
sudo pacman -S fish --noconfirm

# Gnu Stow
sudo pacman -S stow --noconfirm

stow bash tmux nvim fish
fish -c fisher

