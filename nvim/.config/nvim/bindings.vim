" set leader to space
let mapleader = " "

" map jj to <Esc>
imap jj <Esc>

" map semicolon to colon and vice versa
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" press enter for newline without insert
nnoremap <cr> o<esc>

" reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>

" ESC quits the terminal
tnoremap <Esc> <C-\><C-n>:q<CR> 

" upper or lowercase the current word
nnoremap <leader><Up> gUiW
nnoremap <leader><Down> guiW

" Splits
nnoremap \	  <C-W>v<C-W><Right>
nnoremap -     <C-W>s<C-W><Down>

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <BS> <C-W><C-H>

nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

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

" Alchemist: Go to definition in new split and rebind go to Doc
nnoremap <leader>] :split <bar> ExDef<CR>
nnoremap <leader>[ :ExDoc<CR>

" Alchemist: Save file, Compile and open IEx
nnoremap <leader>es :w<CR>:Mix<Space>compile<CR>:IEx<CR><CR>
nnoremap <leader>eb :w<CR>:Mix<Space>compile<CR><CR>

" Omni complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Window swap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <C-W> :call WindowSwap#EasyWindowSwap()<CR>

" File tree
nnoremap <silent> <C-D> :NERDTreeToggle<CR>

" Grep word under cursor
nnoremap <C-S-F> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Manually lint
nnoremap <silent> <leader>l :Neomake<CR>

" Repeat last test
nnoremap <silent> <leader>tl :TestLast<CR> 
" Test under cursor
nnoremap <silent> <leader>tt :TestNearest<CR> 
" Test current file
nnoremap <silent> <leader>tf :TestFile<CR> 
" Run all tests
nnoremap <silent> <leader>ta :TestSuite<CR> 
" Navigate to last test
nnoremap <silent> <leader>tv :TestVisit<CR> 

