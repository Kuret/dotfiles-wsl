#!/bin/bash
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   sudo -v
fi

# Ruby/Rbenv/etc
yaourt -S rbenv --noconfirm
yaourt -S ruby-build --noconfirm
yaourt -S rbenv-binstubs --noconfirm
rbenv install 2.4.0
rbenv global 2.4.0

fish -c "gem install bundler"
fish -c "gem install foreman"
fish -c "gem install rails -v 5.0.1"
