vim.cmd([[
	colorscheme catppuccin

	hi Comment gui=italic
	hi link GitSignsCurrentLineBlame Comment

	hi! CursorLine gui=underline cterm=underline guibg=none
	hi CursorLineNr guibg=NONE

	hi SignColumn guibg=NONE ctermbg=NONE

	hi link NormalFloat  Normal
	hi WinSeparator guibg=none guifg=#c0caf5
]])
