let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles/nvim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +17 plugins.vim
badd +38 bindings.vim
badd +1 nnoremap\ \<silent>\ \<leader>d\ :Explore\<CR>
badd +70 init.vim
badd +1 set\ number\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"\ show\ line\ numbers
badd +1 plugins-config.vim
badd +1 \<CR>:Explore
argglobal
silent! argdel *
edit plugins-config.vim
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe '1resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 1resize ' . ((&columns * 142 + 142) / 284)
exe '2resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 284)
exe '3resize ' . ((&lines * 40 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 141 + 142) / 284)
exe '4resize ' . ((&lines * 28 + 35) / 71)
exe 'vert 4resize ' . ((&columns * 141 + 142) / 284)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 29 - ((28 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
29
normal! 031|
lcd ~/dotfiles/nvim/.config/nvim
wincmd w
argglobal
edit ~/dotfiles/nvim/.config/nvim/plugins.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 28 - ((26 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 037|
lcd ~/dotfiles/nvim/.config/nvim
wincmd w
argglobal
edit ~/dotfiles/nvim/.config/nvim/bindings.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 58 - ((5 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
58
normal! 033|
lcd ~/dotfiles/nvim/.config/nvim
wincmd w
argglobal
edit ~/dotfiles/nvim/.config/nvim/init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 46 - ((10 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 044|
lcd ~/dotfiles/nvim/.config/nvim
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 1resize ' . ((&columns * 142 + 142) / 284)
exe '2resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 284)
exe '3resize ' . ((&lines * 40 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 141 + 142) / 284)
exe '4resize ' . ((&lines * 28 + 35) / 71)
exe 'vert 4resize ' . ((&columns * 141 + 142) / 284)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtoOaAIsT
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
