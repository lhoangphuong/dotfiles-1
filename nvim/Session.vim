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
badd +1 init.lua
badd +363 ~/.local/share/nvim/site/pack/packer/start/copilot.vim/autoload/copilot/agent.vim
badd +53 lua/lsp_mapping.lua
badd +20 lua/cmp_setup.lua
badd +26 ~/dotfiles/x11/.Xresources
badd +81 plugin/sensible.lua
badd +9 lua/flutter.lua
badd +239 lua/plugins.lua
badd +105 lua/telescope_setup.lua
badd +14 lua/lspconfig_setup.lua
badd +39 lua/gitsigns_setup.lua
badd +1 plugin/nightly_sensible.lua
badd +1 @
badd +1 ~/dotfiles/bin/remove-android-app
badd +6 man://json(n)
badd +1 ~/dotfiles/bin/grant-permission-android-app
badd +1 ~/dotfiles/bin/unlock_screen_android.sh
badd +11 lua/nighfly_setup.lua
badd +8 lua/default_scheme.lua
badd +1 lua/gruvbuddy_setup.lua
badd +15 ~/dotfiles/kitty/kitty.conf
badd +8 lua/comment_setup.lua
badd +34 lua/ts.lua
badd +47 lua/lualine_setup.lua
badd +1 ~/dotfiles/vim/plugged/fzf/shell/completion.zsh
badd +93 lua/neotest_setup.lua
badd +206 ~/elca-workspace/tyxr-app-sdk/branded_app/tixngo_show/integration_test/transfer_test.dart
badd +164 Session.vim
badd +1 ~/dotfiles/alacritty/alacritty.yml
badd +10 man://false(1)
badd +1 lua/plenary_setup.lua
badd +19 lua/rest_setup.lua
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit lua/plugins.lua
argglobal
balt lua/nighfly_setup.lua
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
let s:l = 220 - ((76 * winheight(0) + 72) / 144)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 220
normal! 03|
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
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
