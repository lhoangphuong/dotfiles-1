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
badd +6 init.lua
badd +363 ~/.local/share/nvim/site/pack/packer/start/copilot.vim/autoload/copilot/agent.vim
badd +1 lua/lsp_mapping.lua
badd +105 lua/cmp_setup.lua
badd +26 ~/dotfiles/x11/.Xresources
badd +15 plugin/sensible.lua
badd +110 lua/flutter.lua
badd +253 lua/plugins.lua
badd +118 lua/telescope_setup.lua
badd +49 lua/lspconfig_setup.lua
badd +55 lua/gitsigns_setup.lua
badd +1 plugin/nightly_sensible.lua
badd +1 @
badd +1 pull-share-preference-android-app
badd +6 man://json(n)
badd +1 ~/dotfiles/bin/grant-permission-android-app
badd +1 ~/dotfiles/bin/unlock_screen_android.sh
badd +8 lua/gruvbuddy_setup.lua
badd +8 lua/default_scheme.lua
badd +13 ~/dotfiles/kitty/kitty.conf
badd +8 lua/comment_setup.lua
badd +81 lua/ts.lua
badd +52 lua/lualine_setup.lua
badd +1 ~/dotfiles/vim/plugged/fzf/shell/completion.zsh
badd +62 lua/neotest_setup.lua
badd +206 ~/elca-workspace/tyxr-app-sdk/branded_app/tixngo_show/integration_test/transfer_test.dart
badd +1 Session.vim
badd +35 ~/dotfiles/alacritty/alacritty.yml
badd +10 man://false(1)
badd +1 lua/plenary_setup.lua
badd +19 lua/rest_setup.lua
badd +1 ~/dotfiles/zsh/.zshrc
badd +1 ~/dotfiles/bin/install-android-app
badd +53 lua/clangd_setup.lua
badd +62 lua/symbols-outline_setup.lua
badd +1 ~/dotfiles/bin/uninstall-android-app
badd +1 ~/dotfiles/bin/get-file-android-app
badd +4 ~/dotfiles/bin/write-file-android-app
badd +6 ~/dotfiles/tmux/.tmux.conf
badd +1 lua/lua/gruvbuddy_setup.lua
badd +7 lua/nighfly_setup.lua
badd +1 ~/dotfiles/bin/open-android-app
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit ~/dotfiles/tmux/.tmux.conf
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
exe 'vert 1resize ' . ((&columns * 90 + 90) / 180)
exe 'vert 2resize ' . ((&columns * 89 + 90) / 180)
argglobal
balt lua/plugins.lua
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
let s:l = 11 - ((10 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 016|
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim/plugin/sensible.lua", ":p")) | buffer ~/dotfiles/nvim/plugin/sensible.lua | else | edit ~/dotfiles/nvim/plugin/sensible.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim/plugin/sensible.lua
endif
balt ~/dotfiles/nvim/lua/plugins.lua
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
let s:l = 24 - ((23 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 07|
lcd ~/dotfiles/nvim
wincmd w
exe 'vert 1resize ' . ((&columns * 90 + 90) / 180)
exe 'vert 2resize ' . ((&columns * 89 + 90) / 180)
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
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
