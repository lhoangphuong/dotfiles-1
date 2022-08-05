let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/dotfiles/nvim
badd +11 init.lua
<<<<<<< HEAD
badd +55 lua/lsp_mapping.lua
badd +196 lua/plugins.lua
badd +9 ~/dotfiles/vim/vimrc
badd +11 lua/flutter.lua
=======
badd +28 lua/lsp_mapping.lua
badd +152 lua/plugins.lua
badd +9 ~/dotfiles/vim/vimrc
badd +82 lua/flutter.lua
>>>>>>> d9658e926a96d1a23652d7aee0b8a0d5edd6c215
badd +33 ~/dotfiles/zsh/.zshrc
badd +55 lua/telescope_setup.lua
badd +1 lua
badd +33 lua/lspstuff.lua
badd +1 lua/monokai_setup.lua
badd +4 lua/nighfly_setup.lua
badd +21 plugin/sensible.lua
badd +40 lua/ts.lua
badd +6 ~/dotfiles/kitty/kitty.conf
badd +1 lua/gitsigns_setup.lua
badd +3 plugin/nightly_sensible.lua
badd +1 lua/winbar_setup.lua
badd +31 Session.vim
badd +2 lua/cmp_setup.lua
badd +1 ~/dotfiles
badd +106 ~/.local/share/nvim/site/pack/packer/start/barbecue.nvim/README.md
badd +4 term://~/dotfiles/nvim//19178:/bin/zsh
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit lua/plugins.lua
argglobal
<<<<<<< HEAD
balt plugin/sensible.lua
=======
balt lua/flutter.lua
>>>>>>> d9658e926a96d1a23652d7aee0b8a0d5edd6c215
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
<<<<<<< HEAD
let s:l = 197 - ((77 * winheight(0) + 72) / 144)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 197
normal! 0
=======
let s:l = 23 - ((22 * winheight(0) + 72) / 144)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 013|
>>>>>>> d9658e926a96d1a23652d7aee0b8a0d5edd6c215
lcd ~/dotfiles/nvim
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
