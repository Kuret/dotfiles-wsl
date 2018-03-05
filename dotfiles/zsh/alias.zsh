alias gst="git status"
alias gp="git push"
alias gpr="git pull --rebase"
alias gco="git checkout"
alias grd="git fetch -p && git rebase origin/development"
alias grm="git fetch -p && git rebase origin/master"
alias gca="git commit --amend"
alias ga="git add -A"
alias gl="git log"

alias iem="iex -S mix"
alias db="mix deps.get && yarn && node_modules/brunch/bin/brunch build && mix ecto.migrate"
alias dms="mix deps.get && yarn && node_modules/brunch/bin/brunch build && mix phx.server"
alias dup="git checkout master && git pull --rebase && mix deps.get && mix ecto.migrate && yarn && node_modules/brunch/bin/brunch build"

alias zshe="pushd ~/.zsh && nvim && popd"
alias zshc="pushd ~ && nvim ~/.zshrc && popd"
alias nvime="pushd ~/.config/nvim && nvim && popd"

# # # # # # # # # # # #
#  Function aliases   #
# # # # # # # # # # # #

function gr() {
 if [ "$1" = "" ]; then echo "Missing branch name"
 else git fetch -p && git rebase origin/$1
 fi
}

function gc() {
 if [ "$1" = "" ]; then echo "No message"
 else git commit -m "$*"
 fi
}

function gcp() {
 if [ "$1" = "" ]; then echo "No message"
 else git commit -m "$*" && git push
 fi
}
