if [ ! "$(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/p')" = "Microsoft"  ]; then
  exit 0
fi

# PostgresQL
$(pgrep postgres > /dev/null 2>&1) || sudo service postgresql start > /dev/null 2>&1

# Keybase
$(pgrep keybase > /dev/null 2>&1) || run_keybase > /dev/null 2>&1

# Set default shell
export SHELL=/usr/bin/zsh

# Set default browser to Opera on Windows
export BROWSER="wsl-browser-bridge"

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Set display for XServer
export DISPLAY=localhost:0
