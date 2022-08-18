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
badd +41 lua/lsp_mapping.lua
badd +268 lua/plugins.lua
badd +1 ~/dotfiles/vim/vimrc
badd +44 lua/flutter.lua
badd +63 ~/dotfiles/zsh/.zshrc
badd +80 lua/telescope_setup.lua
badd +37 lua/lspstuff.lua
badd +1 lua/monokai_setup.lua
badd +1 lua/nighfly_setup.lua
badd +17 plugin/sensible.lua
badd +40 lua/ts.lua
badd +6 ~/dotfiles/kitty/kitty.conf
badd +1 lua/gitsigns_setup.lua
badd +1 plugin/nightly_sensible.lua
badd +1 lua/winbar_setup.lua
badd +28 lua/cmp_setup.lua
badd +1 ~/dotfiles
badd +106 ~/.local/share/nvim/site/pack/packer/start/barbecue.nvim/README.md
badd +4 term://~/dotfiles/nvim//19178:/bin/zsh
badd +1 nvim/plugin/winbar_setup.lua
badd +1 plugin/winbar_setup.lua
badd +20 lua/hop_setup.lua
badd +1 term://~/dotfiles/nvim//35126:/bin/zsh
badd +3 term://~/dotfiles/nvim//35861:/bin/zsh
badd +16 term://~/dotfiles/nvim//36981:/bin/zsh
badd +2 term://~/dotfiles/nvim//61150:/bin/zsh
badd +36 ~/dotfiles/tmux/.tmux.conf
badd +23 ~/dotfiles/alacritty/alacritty.yml
badd +1 plugin
badd +58 plugin/toggle-term.vim
badd +2 lua/default_scheme.lua
badd +1 lua
badd +3 ~/dotfiles/wezterm/wezterm.lua
badd +1 ~/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/builtin/init.lua
badd +1 neotest_setup.lua
badd +18 lua/lualine_setup.lua
badd +68 lua/neotest_setup.lua
badd +21 ~/elca-workspace/tyxr-app-sdk/branded_app/tixngo_show/lib/main.dart
badd +115 ~/.local/share/nvim/site/pack/packer/start/neotest-dart/lua/neotest-dart/init.lua
badd +199 ~/elca-workspace/tyxr-app-sdk/branded_app/tixngo_show/integration_test/app_test.dart
badd +1 ~/.local/share/nvim/site/pack/packer/start/neotest-dart
badd +5 lua/catppuccin_setup.lua
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit lua/flutter.lua
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
let s:l = 27 - ((15 * winheight(0) + 36) / 73)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 0
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
