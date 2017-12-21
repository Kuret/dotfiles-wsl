" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Use own keymaps for buffergator
let g:buffergator_suppress_keymaps = 1

" Split policy for buffergator
let g:buffergator_viewport_split_policy = 'B'

" Test suite
let test#strategy = "asyncrun" " Use nvim terminal for tests

augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

" Other settings
let g:DevIconsEnableFoldersOpenClose = 1 " Use folder icons in file tree
let g:gruvbox_italic = 1 " Use italics in gruvbox theme
let g:alchemist#elixir_erlang_src = "~/git/elixir" " Custom elixir/erlang docs directory
