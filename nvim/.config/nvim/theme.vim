let g:lightline = {
      \ 'colorscheme': 'kuret',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'readonly', 'modified' ] ],
      \   'right': [ [ '' ],
      \              [ '' ],
      \              [ 'filetype', 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ '' ],
      \             [ 'filename', 'readonly', 'modified' ] ],
      \   'right': [ [ '' ],
      \              [ '' ],
      \              [ 'filetype', 'lineinfo' ] ]
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
    \ }

colorscheme gruvbox

