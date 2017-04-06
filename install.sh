#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo "$0" 
   exit
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
curlCmd = curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
eval $curlCmd
fish -c "fisher omf/theme-agnoster"

# Gnu Stow
sudo pacman -S stow --noconfirm
cd $HOME && git clone https://github.com/Kuret/dotfiles.git
cd dotfiles && stow tmux nvim
