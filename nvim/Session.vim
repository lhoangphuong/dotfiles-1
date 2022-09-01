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
badd +5 init.lua
badd +40 lua/lsp_mapping.lua
badd +277 lua/plugins.lua
badd +123 ~/dotfiles/zsh/.zshrc
badd +6 ~/dotfiles/wezterm/wezterm.lua
badd +35 lua/flutter.lua
badd +46 ~/dotfiles/kitty/kitty.conf
badd +16 Session.vim
badd +32 plugin/sensible.lua
badd +9 lua/vscode_setup.lua
badd +1 lua/moonfly_setup.lua
badd +80 plugin/monkey_term.lua
badd +6 ~/dotfiles/vim/vimrc
badd +138 ~/dotfiles/vim/coc_setup.vim
badd +5 lua/default_scheme.lua
badd +247 lua/lualine_setup.lua
badd +28 ~/dotfiles/tmux/.tmux.conf
badd +1 ~/dotfiles/tmux/tmux-sessionizer.sh
badd +19 lua/lspstuff.lua
badd +38 lua/cmp_setup.lua
badd +7 plugin/nightly_sensible.lua
argglobal
%argdel
$argadd ~/dotfiles/nvim
edit ~/dotfiles/zsh/.zshrc
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
let s:l = 127 - ((55 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 127
normal! 041|
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
