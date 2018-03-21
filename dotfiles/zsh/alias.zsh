alias gst="git status"
alias gp="git push"
alias gpr="git pull --rebase"
alias gco="git checkout"
alias grd="git fetch -p && git rebase origin/development"
alias grm="git fetch -p && git rebase origin/master"
alias gca="git commit --amend"
alias ga="git add"
alias gaa="git add -A"
alias gl="git log --graph --oneline"
alias glm="git log --graph --oneline origin/master.."
alias gld="git log --graph --oneline origin/development.."

alias iem="iex -S mix"
alias db="mix deps.get && yarn && node_modules/brunch/bin/brunch build && mix ecto.migrate"
alias dms="mix deps.get && yarn && node_modules/brunch/bin/brunch build && mix phx.server"
alias dup="git checkout master && git pull --rebase && mix deps.get && mix ecto.migrate && yarn && node_modules/brunch/bin/brunch build"

alias zshe="pushd ~/.zsh && nvim && popd"
alias zshc="pushd ~ && nvim ~/.zshrc && popd"
alias nvime="pushd ~/.config/nvim && nvim && popd"

alias mux="tmuxinator"
alias mx="tmuxinator start"
alias mxe="tmuxinator new"
alias mxs="tmuxinator stop"

alias mxd="tmuxinator start detroit"

# # # # # # # # # # # #
#  Function aliases   #
# # # # # # # # # # # #

# git rebase <branch name>
function gr() {
 if [ "$1" = "" ]; then echo "Missing branch name"
 else git fetch -p && git rebase origin/$1
 fi
}

# git commit with unqouted message
function gc() {
 if [ "$1" = "" ]; then echo "No message"
 else git commit -m "$*"
 fi
}

# git commit with unquoted message + push afterwards
function gcp() {
 if [ "$1" = "" ]; then echo "No message"
 else git commit -m "$*" && git push
 fi
}
