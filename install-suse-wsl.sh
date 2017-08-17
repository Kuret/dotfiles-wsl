#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Windows <-> Linux clipboard support
mkdir ~/lemonade_tmp
wget -P ~/lemonade_tmp/ -q https://github.com/pocke/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
tar xzf ~/lemonade_tmp/lemonade_linux_amd64.tar.gz -C ~/lemonade_tmp/
sudo cp ~/lemonade_tmp/lemonade /usr/local/bin
rm -rf ~/lemonade_tmp/

# Add repos
sudo zypper -n addrepo http://download.opensuse.org/repositories/shells:zsh-users:antigen/openSUSE_Leap_42.2/shells:zsh-users:antigen.repo
sudo zypper -n refresh

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

# Postgresql client
sudo zypper -n in postgresql

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
