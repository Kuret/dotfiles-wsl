let g:lightline = {
      \ 'colorscheme': 'kuret',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'readonly', 'modified' ] ],
      \   'right': [ [ '' ],
      \              [ '' ],
      \              [ 'gitbranch', 'filetype', 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ '' ],
      \             [ 'filename', 'readonly', 'modified' ] ],
      \   'right': [ [ '' ],
      \              [ '' ],
      \              [ 'gitbranch', 'filetype', 'lineinfo' ] ]
      \ },
      \ 'tabline': {
      \     'left': [ [ 'tabs' ] ],
      \     'right': [ [ 'close' ] ]
      \ },
      \ 'separator': {'left': '', 'right': ''},
      \ 'subseparator': { 'left': '', 'right': ''},
      \ 'tabline_separator': {'left': "", 'right': ""},
      \ 'tabline_subseparator': {},
      \ 'component': {
      \   'helloworld': 'Hello, world!'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
    \ }

let g:gruvbox_contrast_dark = 'dark'
let g:gruvbox_italic = 1 " Use italics in gruvbox theme

if filereadable( expand("$HOME/.config/nvim/plugged/gruvbox/colors/gruvbox.vim") )
    colorscheme gruvbox
endif

hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
