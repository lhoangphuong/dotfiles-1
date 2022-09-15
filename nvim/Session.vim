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
badd +5 init.lua
badd +37 ~/dotfiles/vim/vimrc
badd +2540 ~/dotfiles/vim/autoload/plug.vim
badd +250 lua/plugins.lua
badd +60 lua/cmp_setup.lua
badd +29 plugin/sensible.lua
badd +147 ~/dotfiles/zsh/.zshrc
badd +1 Session.vim
badd +181 ~/elca-workspace/tyxr-app-sdk/modules/sso_aws/lib/screen/confirmation_page.dart
badd +25 lua/lsp_mapping.lua
badd +12 plugin/nightly_sensible.lua
badd +60 lua/flutter.lua
badd +83 plugin/monkey_term.lua
badd +20 lua/lspstuff.lua
badd +14 lua/clangd_setup.lua
badd +1 lua
badd +1 lua/rest_setup.lua
badd +6 lua/ts.lua
badd +3 plugin/winbar_setup.lua
badd +12 ~/dotfiles/wezterm/wezterm.lua
badd +57 ~/dotfiles/alacritty/alacritty.yml
badd +10 lua/nighfly_setup.lua
argglobal
%argdel
$argadd ~/dotfiles/nvim/
edit lua/flutter.lua
argglobal
balt init.lua
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
let s:l = 53 - ((37 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 53
normal! 047|
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
