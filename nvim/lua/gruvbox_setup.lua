vim.cmd([[
	colorscheme gruvbox
	hi Normal guibg=NONE ctermbg=NONE
	hi Comment gui=italic
	hi link GitSignsCurrentLineBlame Comment

	hi! CursorLine gui=underline cterm=underline guibg=none
	hi CursorLineNr guibg=NONE
	hi CursorColumn guibg=#3c3836
	hi SignColumn guibg=NONE ctermbg=NONE

	hi link NormalFloat  Normal
	hi link FidgetTask Normal
]])
