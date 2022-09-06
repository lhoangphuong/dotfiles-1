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
badd +37 ~/dotfiles/vim/vimrc
badd +2540 ~/dotfiles/vim/autoload/plug.vim
badd +149 lua/plugins.lua
badd +60 lua/cmp_setup.lua
badd +15 plugin/sensible.lua
badd +147 ~/dotfiles/zsh/.zshrc
badd +1 Session.vim
badd +181 ~/elca-workspace/tyxr-app-sdk/modules/sso_aws/lib/screen/confirmation_page.dart
badd +1 lua/lsp_mapping.lua
badd +4 plugin/nightly_sensible.lua
badd +7 lua/flutter.lua
badd +63 plugin/monkey_term.lua
badd +8 lua/lspstuff.lua
badd +21 lua/clangd_setup.lua
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit lua/lspstuff.lua
argglobal
balt lua/clangd_setup.lua
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
let s:l = 14 - ((13 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 08|
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
