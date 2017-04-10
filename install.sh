#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Tmux + Plugin manager
sudo pacman -S tmux --noconfirm

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
stow tmux nvim fish
fish -c fisher

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

#
# Development stuff
#

# Redis
sudo pacman -S redis --noconfirm
sudo systemctl start redis
sudo systemctl enable redis

# Qt/QtWebKit
sudo pacman -S gt5-base qt5-webkit --noconfirm

# Node/npm
sudo pacman -S nodejs npm --noconfirm

# Postgresql
sudo pacman -S postgresql --noconfirm

sudo systemctl start postgresql
sudo systemctl enable postgresql

export $HOMEUSER=$USER # Preserve current username
sudo -Eu postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
sudo -Eu postgres createuser $HOMEUSER --superuser

# Ruby/Rbenv/etc
yaourt -S rbenv --noconfirm
yaourt -S ruby-build --noconfirm
yaourt -S rbenv-binstubs --noconfirm
rbenv install 2.4.0
rbenv global 2.4.0

fish -c "gem install bundler"
fish -c "gem install foreman"
fish -c "gem install rails -v 5.0.1"
