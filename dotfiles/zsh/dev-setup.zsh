# # # # # # #
#   Asdf    #
# # # # # # #

source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash


# # # # # # #
#    NPM    #
# # # # # # #

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
