vim.cmd([[
	colorscheme catppuccin

	hi Comment gui=italic
	hi link GitSignsCurrentLineBlame Comment

	hi! CursorLine gui=underline cterm=underline guibg=none
	hi CursorLineNr guibg=NONE

	hi CursorColumn guibg=#3c3836

	hi SignColumn guibg=NONE ctermbg=NONE

	hi link NormalFloat  Normal
	hi WinSeparator guibg=none guifg=#c0caf5
]])


