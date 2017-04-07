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

# Restore dotfiles
stow bash tmux nvim fish
fish -c fisher

#
# Development stuff
#

# Redis
sudo pacman -S redis

# Qt/QtWebKit
sudo pacman -S gt5-base qt5-webkit

# Node/npm
sudo pacman -S nodejs npm

# Postgresql
sudo pacman -S postgresql
export $HOMEUSER=$USER # Preserve current username

sudo -Eu postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
sudo -Eu postgres createuser $HOMEUSER --superuser

# Ruby/Rbenv/etc
yaourt -S rbenv-git ruby-build rbenv-binstubs
rbenv install 2.4.0
rbenv global 2.4.0

gem install bundler
gem install foreman
gem install rails -v 5.0.1
