" set leader to space
let mapleader = " "

" map jj to <Esc>
imap jj <Esc>

" map semicolon to colon and vice versa
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" press leader + o for newline without insert
nnoremap <leader>o o<Esc>


" reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>

" ESC quits the terminal
tnoremap <Esc> <C-\><C-n>:q<CR> 

" Toggle QuickFix
nnoremap <leader>cc :call asyncrun#quickfix_toggle(8)<CR>

" upper or lowercase the current word
nnoremap <leader>lc guiW
nnoremap <leader>uc gUiW

" QuickFix navigation
autocmd FileType qf nnoremap <buffer> <CR> <C-w><CR>:ccl<CR>:resize 20<CR>
autocmd FileType qf nnoremap <buffer> <leader><CR> <C-w><CR><C-W>L<CR>:ccl<CR>
nnoremap <leader>qfo :copen<CR>
nnoremap <leader>qfc :ccl<CR>

" Splits
nnoremap <silent> <leader>\ :vnew<CR>:Explore<CR>
nnoremap <silent> <leader>- :new<CR>:Explore<CR>

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" For shitty terminals
nnoremap <BS> <C-W><C-H>

" Resize
nnoremap <C-UP>    <C-W>+
nnoremap <C-DOWN>  <C-W>-
nnoremap <C-LEFT>    <C-W><
nnoremap <C-RIGHT>  <C-W>>

" Tabs
nnoremap <leader><Right> :tabn<CR>
nnoremap <leader><Left> :tabp<CR>
nnoremap <leader><Down> :tabc<CR>
nnoremap <leader><Up> :tabnew<CR>
nnoremap <leader><leader><Down> :tabo<CR>

" Buffers
nnoremap <leader>b :BuffergatorToggle<CR>

" Alchemist: Go to definition in new split and rebind go to Doc
autocmd FileType ex,exs nnoremap <buffer> <leader>] :split <bar> ExDef<CR>
autocmd FileType ex,exs nnoremap <buffer> <leader>[ :ExDoc<CR>

" Alchemist: Save file, Compile and open IEx
nnoremap <leader>es :w<CR>:Mix<Space>compile<CR>:IEx<CR><CR>
nnoremap <leader>eb :w<CR>:Mix<Space>compile<CR><CR>

" OmniSharp: Remove ^M control chars from file
autocmd FileType cs 1,$s///ge

" Omni complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" EasyMotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> / incsearch#go(<SID>config_easyfuzzymotion())
map <leader>f <Plug>(easymotion-bd-f2)

" Snippets complete
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Window swap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>w :call WindowSwap#EasyWindowSwap()<CR>

" Grep word under cursor
nnoremap <C-S-F> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Clear highlight
nnoremap <silent> <leader>nh :noh<CR>

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

