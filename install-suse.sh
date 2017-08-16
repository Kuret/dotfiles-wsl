#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Add repos
sudo zypper addrepo http://download.opensuse.org/repositories/shells:zsh-users:antigen/openSUSE_Leap_42.2/shells:zsh-users:antigen.repo
sudo zypper refresh

# Tmux
sudo zypper -n in tmux

# Neovim + plugins
sudo zypper -n in neovim python-neovim python3-neovim

# Zsh + Antigen
sudo zypper -n in zsh antigen

# Gnu Stow
sudo zypper -n in stow

# Restore dotfiles
stow tmux nvim zsh

nvim --headless +PlugInstall +qall
nvim --headless +UpdateRemotePlugins +qall

#
# Development stuff
#

# Redis
sudo zypper -n in redis
sudo systemctl start redis
sudo systemctl enable redis

# Node/npm
sudo zypper -n in nodejs npm

# Postgresql
sudo zypper -n in postgresql
sudo systemctl start postgresql
sudo systemctl enable postgresql

export $HOMEUSER=$USER # Preserve current username
sudo -Eu postgres initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
sudo -Eu postgres createuser $HOMEUSER --superuser

# Ruby/Rbenv/etc
sudo zypper -n in rbenv ruby-build
rbenv install 2.4.0
rbenv global 2.4.0

zsh -c "gem install bundler"
zsh -c "gem install foreman"
zsh -c "gem install rails -v 5.0.1"

# Elixir/Phoenix
sudo zypper -n in elixir
zsh -c "mix local.hex"
zsh -c "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez"
