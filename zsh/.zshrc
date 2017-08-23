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

# # # # # # #
#  Exports  #
# # # # # # #

# Add the HOME bin directory to the PATH
export PATH="${HOME}/bin:${PATH}"

# Set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Needed to connect to PSQL on Windows host
export PGHOST=localhost

# Set default browser to Opera on Windows
export BROWSER="wsl-browser-bridge"

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

# Clean up generations older than 5 days
nix-env --delete-generations 5d &> /dev/null
nix-store --gc &> /dev/null


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

