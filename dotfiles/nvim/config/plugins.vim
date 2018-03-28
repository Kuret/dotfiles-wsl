" Non-managed plugins
source $HOME/.config/nvim/config/session.vim

call plug#begin('~/.config/nvim/plugged')
" General
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ReplaceWithRegister'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Task runners
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
Plug 'janko-m/vim-test'

" General languages
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'sheerun/vim-polyglot'

" Elixir + Phoenix
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'wesQ3/vim-windowswap'

" Theming
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Git support
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
call plug#end()
