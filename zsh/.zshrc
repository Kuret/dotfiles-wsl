# General config
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=4000
SAVEHIST=4000
setopt autocd extendedglob
bindkey -e

zstyle :compinstall filename '/home/rick/.zshrc'
autoload -Uz compinit
compinit

# Functions
source ~/.config/zsh/functions

# Nix
source ~/.nix-profile/etc/profile.d/nix.sh

# Fix locale errors
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
