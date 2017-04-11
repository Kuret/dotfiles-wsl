source ~/.config/fish/alias.fish

export EDITOR='nvim'

set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
