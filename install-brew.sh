#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Detect WSL Environment
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then

	# Windows <-> Linux clipboard support
	mkdir ~/lemonade_tmp
	wget -P ~/lemonade_tmp/ -q https://github.com/pocke/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
	tar xzf ~/lemonade_tmp/lemonade_linux_amd64.tar.gz -C ~/lemonade_tmp/
	sudo cp ~/lemonade_tmp/lemonade /usr/local/bin
	rm -rf ~/lemonade_tmp/

fi

# Tmux
brew install tmux

# Neovim + plugins
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade

brew install neovim

# Zsh + Antigen
brew install zsh
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Gnu Stow
brew install stow

# Restore dotfiles
stow tmux nvim zsh

nvim --headless +UpdateRemotePlugins +qall
nvim --headless +PlugInstall +qall

#
# Development stuff
#

# Redis
brew install redis

# Node/npm
brew install nodejs npm

# Postgresql client
brew install postgresql

# Ruby/Rbenv/etc
brew install rbenv ruby-build rbenv-binstubs
rbenv install 2.4.0
rbenv global 2.4.0
rbenv rehash

zsh -c "gem install bundler"
zsh -c "gem install foreman"
zsh -c "gem install rails -v 5.0.1"

# Elixir/Phoenix
brew install elixir exenv elixir-build
exenv install 1.5.0
exenv global 1.5.0
exenv rehash

zsh -c "mix local.hex"
zsh -c "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez"
