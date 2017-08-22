# # # # # # #
#  General  #
# # # # # # #

source ~/.asdf/asdf.sh
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=4000
SAVEHIST=4000
setopt autocd extendedglob
unsetopt BG_NICE
bindkey -e

zstyle :compinstall filename '/home/rick/.zshrc'
autoload -Uz compinit
compinit


export PGHOST=localhost

# # # # # # #
#   Asdf    #
# # # # # # #

source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash


# # # # # # #
#   Nix     #
# # # # # # #

source ~/.nix-profile/etc/profile.d/nix.sh

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"


# # # # # # # # # # #
#  Alias/Functions  #
# # # # # # # # # # #

source ~/.asdf/asdf.sh
source ~/.config/zsh/functions


# # # # # # #
#   Zplug   #
# # # # # # #

# Theme config
DEFAULT_USER=`whoami`
SHELLDER_DIRECTORY_BG=white
SHELLDER_DIRECTORY_FG=black

# Zplug
source ~/.zplug/init.zsh
zplug 'simnalamburt/shellder', as:theme 

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  echo; zplug install
fi

# Load plugins
zplug load

