" =============================================================================
" Filename: autoload/lightline/colorscheme/kuret.vim
" Author: Kuret
" =============================================================================
let s:darkbg = [ '#30302c ', 236 ]
let s:darkfg = [ '#808070', 244 ]
let s:lightfg = [ '#a8a897', 248 ]
let s:yellow = [ '#d8af5f', 3 ]
let s:red = [ '#d68787', 131 ]
let s:magenta = [ '#df5f87', 168 ]
let s:peach = [ '#d7afaf', 181 ]
let s:green = [ '#87af87', 108 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:darkfg, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.normal.right = [ [ s:darkfg, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.inactive.right = [ [ s:darkfg, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.inactive.left =  [ [ s:darkfg, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.insert.left = [ [ s:green, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.replace.left = [ [ s:magenta, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.visual.left = [ [ s:peach, s:darkbg ], [ s:darkfg, s:darkbg ] ]
let s:p.normal.middle = [ [ s:darkfg, s:darkbg ] ]
let s:p.inactive.middle = [ [ s:darkfg, s:darkbg ] ]
let s:p.tabline.left = [ [ s:darkfg, s:darkbg ] ]
let s:p.tabline.tabsel = [ [ s:lightfg, s:darkbg ] ]
let s:p.tabline.middle = [ [ s:darkfg, s:darkbg ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:red, s:darkbg ] ]
let s:p.normal.warning = [ [ s:yellow, s:darkbg ] ]

let g:lightline#colorscheme#kuret#palette = lightline#colorscheme#flatten(s:p)
