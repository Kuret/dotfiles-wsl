#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Create temp directory
mkdir -p ~/temp

# Windows <-> Linux clipboard support
if ! type -a lemonade &> /dev/null; then
   wget -P ~/temp/ -q https://github.com/pocke/lemonade/releases/download/v1.1.1/lemonade_linux_amd64.tar.gz
   tar xzf ~/temp/lemonade_linux_amd64.tar.gz -C ~/temp/
   sudo cp ~/temp/lemonade /usr/local/bin
fi

# Repos
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:aguignard/ppa -y
sudo add-apt-repository ppa:therealkenc/wsl-pulseaudio -y

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -O ~/temp/
sudo dpkg -i ~/temp/erlang-solutions_1.0_all.deb

# Precompiled packages
wget http://ppa.launchpad.net/oiteam/xfce4/ubuntu/pool/main/x/xfce4-windowck-plugin/xfce4-windowck-plugin_0.3.1-0ubuntu1~oiteam0_amd64.deb -O ~/temp/
wget http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/all/arc-theme_1488477732.766ae1a-0_all.deb -O ~/temp/

# Update apt sources
sudo apt-get -y update

# Build/dev tools
sudo apt-get -y install aptitude software-properties-common build-essential
sudo apt-get -y install libncurses5-dev unixodbc-dev cmake autoconf m4 libev-dev libyajl-dev

# Stuff for GUI applications
sudo apt-get -y install libgl1-mesa-dev libglu1-mesa-dev libpng3
sudo apt-get -y install libfreetype6-dev libfontconfig1-dev libpango1.0-dev
sudo apt-get -y install xcb xcb-proto libxcb1-dev libxcb-keysyms1-dev libxcb-ewmh-dev python-xcbgen
sudo apt-get -y install libxcb-util0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-cursor-dev
sudo apt-get -y install libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev
sudo apt-get -y install libxkbcommon-x11-dev libxcb-xrm-dev
sudo apt-get -y install libstartup-notification0-dev
sudo apt-get -y install x11-xserver-utils xclip libwxgtk3.0-dev libgtk3.0
sudo apt-get -y install gnome-accessibility-themes gnome-themes-standard gnome-themes-standard-data

sudo apt-get -y install xfce4-settings xfce4-panel compton lxappearance
sudo apt-get -y install libpulse0=1:8.0-0ubuntu3.3ppa1
sudo apt-get -y install nitrogen rofi

sudo dpkg -i ~/temp/xfce4-windowck-plugin*.deb
sudo dpkg -i ~/temp/arc-theme*.deb

# i3 WM
mkdir -p ~/git && pushd ~/git

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

popd

# Termite terminal
mkdir -p ~/temp/termite && pushd ~/temp/termite

wget -O - https://raw.githubusercontent.com/Corwind/termite-install/master/termite-install.sh | sh

popd

# Install Tmux, Zsh, Stow, Silver Searcher
sudo apt-get -y install tmux zsh stow silversearcher-ag

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

# Make files in ~/bin executable
chmod +x ~/bin/*

# Install Neovim plugins
nvim --headless +UpdateRemotePlugins +qall
nvim --headless +PlugInstall +qall


# # # # # # # # # # #
# Development stuff #
# # # # # # # # # # #

# Installs:
#   Inotify: needed for Phoenix file watching
#   Imagemagick
#   Yarn
#   Nginx, set config dir with -p (example in zsh/funtions)
#   Redis/
sudo apt-get -y install inotify-tools imagemagick yarn nginx redis-server

# Postgres
# Assumes a postgres server is running on the windows side
# with default credentials (postgres/postgres)
# Afterwards you should be able to connect using just 'psql'
sudo apt-get -y install postgresql-client-common postgresql-client libpq-dev
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

# Remove temp directory
rm -rf ~/temp
