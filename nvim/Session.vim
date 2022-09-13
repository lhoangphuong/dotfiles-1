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
badd +12 init.lua
badd +37 ~/dotfiles/vim/vimrc
badd +2540 ~/dotfiles/vim/autoload/plug.vim
badd +160 lua/plugins.lua
badd +60 lua/cmp_setup.lua
badd +44 plugin/sensible.lua
badd +147 ~/dotfiles/zsh/.zshrc
badd +1 Session.vim
badd +181 ~/elca-workspace/tyxr-app-sdk/modules/sso_aws/lib/screen/confirmation_page.dart
badd +17 lua/lsp_mapping.lua
badd +4 plugin/nightly_sensible.lua
badd +3 lua/flutter.lua
badd +83 plugin/monkey_term.lua
badd +20 lua/lspstuff.lua
badd +11 lua/clangd_setup.lua
badd +1 lua
badd +1 lua/rest_setup.lua
badd +6 lua/ts.lua
badd +3 plugin/winbar_setup.lua
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 132 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 139 + 136) / 272)
argglobal
balt plugin/sensible.lua
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
let s:l = 1 - ((0 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim/plugin/sensible.lua", ":p")) | buffer ~/dotfiles/nvim/plugin/sensible.lua | else | edit ~/dotfiles/nvim/plugin/sensible.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim/plugin/sensible.lua
endif
balt ~/dotfiles/nvim/lua/lsp_mapping.lua
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
let s:l = 54 - ((0 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 54
normal! 0
lcd ~/dotfiles/nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 132 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 139 + 136) / 272)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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
