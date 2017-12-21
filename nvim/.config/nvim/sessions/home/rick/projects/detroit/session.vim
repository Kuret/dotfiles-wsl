let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/detroit
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 lib/detroit_web/controllers/user/external_achievements_controller.ex
badd +1 test/detroit_web/controllers/user/external_achievements_controller_test.exs
badd +15 lib/detroit_course_manager_web/controllers/subject_controller.ex
badd +29 lib/detroit/external_achievements/policy.ex
argglobal
silent! argdel *
edit lib/detroit_web/controllers/user/external_achievements_controller.ex
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 141 + 142) / 284)
exe '2resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 284)
exe '3resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 142 + 142) / 284)
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
let s:l = 1 - ((0 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit lib/detroit_web/controllers/user/external_achievements_controller.ex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit lib/detroit_web/controllers/user/external_achievements_controller.ex
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 12 - ((11 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 141 + 142) / 284)
exe '2resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 284)
exe '3resize ' . ((&lines * 34 + 35) / 71)
exe 'vert 3resize ' . ((&columns * 142 + 142) / 284)
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
