#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Windows <-> Linux clipboard support
mkdir ~/lemonade_tmp
wget -P ~/lemonade_tmp/ -q https://github.com/pocke/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
tar xzf ~/lemonade_tmp/lemonade_linux_amd64.tar.gz -C ~/lemonade_tmp/
sudo cp ~/lemonade_tmp/lemonade /usr/local/bin
rm -rf ~/lemonade_tmp/

# Nix package manager
curl https://nixos.org/nix/install | sh
source ~/.nix-profile/etc/profile.d/nix.sh

# Git
nix-env -i git

# Tmux
nix-env -i tmux

# Neovim + plugins
nix-env -i neovim python27Packages.neovim python36Packages.neovim

# Zsh + Zgen
nix-env -i zsh
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# Set default shell
chsh -s $(which tmux)

# Gnu Stow
nix-env -i stow

# Restore dotfiles
stow tmux nvim zsh

nvim --headless +UpdateRemotePlugins +qall
nvim --headless +PlugInstall +qall

#
# Development stuff
#

# Redis/Node/Psql
nix-env -i redis nodejs postgresql

# Ruby/Elixir
nix-env -i ruby
nix-env -i elixir

# Ruby gems
zsh -c "gem install bundler"
zsh -c "gem install foreman"
zsh -c "gem install rails -v 5.0.1"

# Elixir mix
zsh -c "mix local.hex"
zsh -c "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez"
