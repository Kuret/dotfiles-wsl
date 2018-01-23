# # # # # # #
#  General  #
# # # # # # #

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=99999
SAVEHIST=4000
setopt autocd extendedglob
unsetopt BG_NICE
bindkey -e

zstyle :compinstall filename '/home/rick/.zshrc'
autoload -Uz compinit
compinit

# # # # # # #
# Keybinds  #
# # # # # # #

# Vim bindings
bindkey -v

# # # # # # #
#  Exports  #
# # # # # # #

# Add the HOME bin directory to the PATH
export PATH="${HOME}/bin:${PATH}"

# Set default shell
export SHELL=/usr/bin/zsh

# Set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Needed to connect to PSQL on Windows host
export PGHOST=localhost

# Set default browser to Opera on Windows
export BROWSER="wsl-browser-bridge"

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Set display
export DISPLAY=localhost:0

# # # # # # #
#   Asdf    #
# # # # # # #

source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

# Npm -g without sudo
if [ ! -d ~/.npm-packages ]; then
  mkdir ${HOME}/.npm-packages
fi

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# # # # # # #
#   Yarn    #
# # # # # # #

export PATH="$HOME/.yarn/bin:$PATH"


# # # # # # #
#   Zplug   #
# # # # # # #

# Theme config
MSYS=" " # Need to pass the MSYS check in shellder theme to override git BG colors
DEFAULT_USER=`whoami`
SHELLDER_DIRECTORY_BG=black
SHELLDER_DIRECTORY_FG=white
SHELLDER_GIT_DIRTY_BG=yellow
SHELLDER_GIT_CLEAN_BG=cyan

# Zplug
source ~/.zplug/init.zsh

zplugs=()
zplug 'simnalamburt/shellder', as:theme 

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  echo; zplug install
fi

# Load plugins
zplug load


# # # # # # # # # # #
#  Alias/Functions  #
# # # # # # # # # # #

if [ -d ~/.config/zsh/functions ]; then
  for file in ~/.config/zsh/functions/*.zsh; do
    source $file
  done
fi


# # # # # # # # # # #
#  WSL Fixes	    #
# # # # # # # # # # #

# CD to user home, because WSL defaults$
cd ~
