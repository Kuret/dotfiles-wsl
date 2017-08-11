#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

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
