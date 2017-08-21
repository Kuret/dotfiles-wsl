# General config
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=4000
SAVEHIST=4000
setopt autocd extendedglob
unsetopt BG_NICE
bindkey -e

zstyle :compinstall filename '/home/rick/.zshrc'
autoload -Uz compinit
compinit

# Nix
source ~/.nix-profile/etc/profile.d/nix.sh

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"

# Functions
source ~/.config/zsh/functions

# Theme config
DEFAULT_USER=`whoami`
SHELLDER_DIRECTORY_BG=black
SHELLDER_DIRECTORY_FG=white

# Zplug
source ~/.zplug/init.zsh
# zplug "github/repo"
# zplug "github/repo", from:oh-my-zsh
# zplug "github/repo", as:theme

zplug 'simnalamburt/shellder', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  echo; zplug install
fi

# Load plugins
zplug load

# Asdf
source ~/.asdf/asdf.sh
