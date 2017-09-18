#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Windows <-> Linux clipboard support
if ! type -a lemonade &> /dev/null; then
   mkdir ~/lemonade_tmp
   wget -P ~/lemonade_tmp/ -q https://github.com/pocke/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
   tar xzf ~/lemonade_tmp/lemonade_linux_amd64.tar.gz -C ~/lemonade_tmp/
   sudo cp ~/lemonade_tmp/lemonade /usr/local/bin
   rm -rf ~/lemonade_tmp/
fi

# Repos
sudo add-apt-repository ppa:neovim-ppa/stable -y
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O ~/temp/
sudo dpkg -i ~/temp/erlang-solutions_1.0_all.deb
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get -y update

# Build/dev tools
sudo apt-get -y install software-properties-common build-essential autoconf m4 libncurses5-dev unixodbc-dev
sudo apt-get -y install libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng3

# Install Tmux, Zsh, Stow, Silver Searcher
sudo apt-get -y install software-properties-common build-essential zsh stow silversearcher-ag

# Neovim
sudo apt-get -y install neovim
sudo apt-get -y install python-dev python-pip python3-dev python3-pip

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
stow tmux nvim zsh nginx npm bin

# Install Neovim plugins
nvim --headless +UpdateRemotePlugins +qall
nvim --headless +PlugInstall +qall


# # # # # # # # # # #
# Development stuff #
# # # # # # # # # # #

# Installs:
#   Inotify: needed for Phoenix
#   Yarn
#   Nginx, set config dir with -p (example in zsh/funtions)
#   Redis/Psql client
sudo apt-get -y install inotify-tools yarn nginx redis-server postgresql-client-common postgresql-client libpq-dev

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
asdf install ruby 2.4.0
asdf global ruby 2.4.0

zsh -c "gem install bundler"
zsh -c "gem install foreman"
zsh -c "gem install rails -v 5.0.1"

# Erlang
sudo apt-get -y install erlang

# Elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install elixir 1.5.1-otp-20
asdf global elixir 1.5.1-otp-20

zsh -c "mix local.hex --force"
zsh -c "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force"
