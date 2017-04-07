" TrueColor
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Vim-plug
source $HOME/.config/nvim/plugins.vim

" Functions

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap <C-S-F> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" KEYBINDS

" Splits

" Splits
map \	  <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
" Split direction
set splitbelow
set splitright
" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Resize
nnoremap <C-UP>    <C-W>+<CR>
nnoremap <C-DOWN>  <C-W>-<CR>
nnoremap <C-LEFT>    <C-W><<CR>
nnoremap <C-RIGHT>  <C-W>><CR>

" Tabs
nnoremap <S-L> :tabn<CR>
nnoremap <S-H> :tabp<CR>
nnoremap <S-J> :tabc<CR>
nnoremap <S-K> :tabnew<CR>
nnoremap <S-O> :tabo<CR>

" Window swap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <C-W> :call WindowSwap#EasyWindowSwap()<CR>

" File tree
nnoremap <silent> <C-D> :NERDTreeToggle<CR>

" Test suite
let test#strategy = "neovim"
" Repeat last test
nnoremap <silent> <C-E> :TestLast<CR> 
" Test under cursor
nnoremap <silent> <C-R> :TestNearest<CR> 
" Test current file
nnoremap <silent> <C-T> :TestFile<CR> 
" Run all tests
nnoremap <silent> <C-Y> :TestSuite<CR> 
" Navigate to last test
nnoremap <silent> <C-U> :TestVisit<CR> 

" Autocomplete
let g:deoplete#enable_at_startup = 1

" Syntax
syntax on

" Color scheme
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark
