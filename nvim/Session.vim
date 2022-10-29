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
badd +16 init.lua
badd +363 ~/.local/share/nvim/site/pack/packer/start/copilot.vim/autoload/copilot/agent.vim
badd +48 lua/lsp_mapping.lua
badd +33 lua/cmp_setup.lua
badd +26 ~/dotfiles/x11/.Xresources
badd +85 plugin/sensible.lua
badd +43 lua/flutter.lua
badd +62 lua/plugins.lua
badd +118 lua/telescope_setup.lua
badd +31 lua/lspconfig_setup.lua
badd +16 lua/gitsigns_setup.lua
badd +1 plugin/nightly_sensible.lua
badd +1 @
badd +1 pull-share-preference-android-app
badd +6 man://json(n)
badd +1 ~/dotfiles/bin/grant-permission-android-app
badd +1 ~/dotfiles/bin/unlock_screen_android.sh
badd +8 lua/gruvbuddy_setup.lua
badd +8 lua/default_scheme.lua
badd +20 ~/dotfiles/kitty/kitty.conf
badd +8 lua/comment_setup.lua
badd +81 lua/ts.lua
badd +243 lua/lualine_setup.lua
badd +1 ~/dotfiles/vim/plugged/fzf/shell/completion.zsh
badd +153 lua/neotest_setup.lua
badd +206 ~/elca-workspace/tyxr-app-sdk/branded_app/tixngo_show/integration_test/transfer_test.dart
badd +2 Session.vim
badd +65 ~/dotfiles/alacritty/alacritty.yml
badd +10 man://false(1)
badd +1 lua/plenary_setup.lua
badd +19 lua/rest_setup.lua
badd +119 ~/dotfiles/zsh/.zshrc
badd +1 ~/dotfiles/bin/install-android-app
badd +53 lua/clangd_setup.lua
badd +62 lua/symbols-outline_setup.lua
badd +1 ~/dotfiles/bin/uninstall-android-app
badd +1 ~/dotfiles/bin/get-file-android-app
badd +4 ~/dotfiles/bin/write-file-android-app
badd +10 ~/dotfiles/tmux/.tmux.conf
badd +1 lua/lua/gruvbuddy_setup.lua
badd +1 ~/dotfiles/bin/open-android-app
badd +1 plugin
badd +3 lua/blackpink_setup.lua
badd +1 lua
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit plugin/sensible.lua
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
wincmd =
argglobal
balt Session.vim
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
let s:l = 1 - ((0 * winheight(0) + 41) / 83)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim/lua/plugins.lua", ":p")) | buffer ~/dotfiles/nvim/lua/plugins.lua | else | edit ~/dotfiles/nvim/lua/plugins.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim/lua/plugins.lua
endif
balt ~/dotfiles/nvim/Session.vim
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
let s:l = 62 - ((33 * winheight(0) + 41) / 83)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 62
normal! 08|
lcd ~/dotfiles/nvim
wincmd w
wincmd =
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
