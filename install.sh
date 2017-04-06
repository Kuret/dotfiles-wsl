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

# Node/npm
sudo pacman -S nodejs npm

# Postgresql
yaourt -S postgresql-9.5

# Ruby/Rbenv/etc
yaourt -S rbenv-git ruby-build rbenv-binstubs
rbenv install 2.4.0
rbenv global 2.4.0

gem install bundler
gem install foreman
gem install rails -v 5.0.1
