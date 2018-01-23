#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Create temp directory
mkdir -p ~/temp

# Repos
sudo add-apt-repository ppa:neovim-ppa/stable -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O ~/temp/
sudo dpkg -i ~/temp/erlang-solutions_1.0_all.deb

# Update apt sources
sudo apt-get -y update

# Build/dev tools
sudo apt-get -y install software-properties-common build-essential
sudo apt-get -y install libncurses5-dev unixodbc-dev cmake autoconf m4 libev-dev libyajl-dev
sudo apt-get -y install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x

sudo apt-get -y install neovim python-dev python-pip python3-dev python3-pip
sudo apt-get -y install inotify-tools imagemagick yarn nginx redis-server
sudo apt-get -y install postgresql-client-common postgresql-client libpq-dev

# Terminal utilities
sudo apt-get -y install zsh dvtm stow silversearcher-ag ranger w3m rtv

# Neovim python plugin
pip3 install --upgrade pip
pip3 install neovim

# Set neovim as default
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
echo 0 | sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
echo 0 | sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
echo 0 | sudo update-alternatives --config editor

# Zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
chmod -R 755 ~/.zplug

# Restore dotfiles
stow nvim zsh npm bin

# Make files in ~/bin executable
chmod +x ~/bin/*

# Install Neovim plugins
nvim --headless +UpdateRemotePlugins +qall
nvim --headless +PlugInstall +qall


# # # # # # # # # # #
# Development stuff #
# # # # # # # # # # #

# Postgres
# Assumes a postgres server is running on the windows side
# with default credentials (postgres/postgres)
# Afterwards you should be able to connect using just 'psql'
psql -U postgres -c "CREATE USER $USER WITH SUPERUSER"
psql -U postgres -c "CREATE DATABASE $USER"

# Asdf version manager
git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf" --branch v0.3.0
source ~/.asdf/asdf.sh

# Node
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring # Node.js team's PGP keys

asdf install nodejs 8.4.0
asdf global nodejs 8.4.0

# Ruby
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.4.2
asdf global ruby 2.4.2

zsh -c "gem install bundler"
zsh -c "gem install foreman"
zsh -c "gem install rails -v 5.0.1"

# Erlang
sudo apt-get -y install erlang

# Elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install elixir 1.6.0-otp-20
asdf global elixir 1.6.0-otp-20

zsh -c "mix local.hex --force"
zsh -c "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force"

# Remove temp directory
rm -rf ~/temp
