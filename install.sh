#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Yaourt
sudo echo "[archlinuxfr]" >> /etc/pacman.conf
sudo echo "SigLevel = Never" >> /etc/pacman.conf
sudo echo "Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf
sudo pacman -Sy yaourt --noconfirm --noconfirm

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

stow tmux nvim fish
fish -c fisher

