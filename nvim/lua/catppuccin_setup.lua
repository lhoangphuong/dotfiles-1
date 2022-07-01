require 'catppuccin'.setup {
	transparent_background = true,
}

vim.cmd([[
	colorscheme catppuccin

	hi Comment gui=italic guifg=#6c7886
	" hi link GitSignsCurrentLineBlame Comment

	hi! CursorLine gui=underline cterm=underline guibg=none
	hi CursorLineNr guibg=NONE

	hi SignColumn guibg=NONE ctermbg=NONE

	hi link NormalFloat  Normal
	hi WinSeparator guibg=none guifg=#c0caf5

	hi DiagnosticHint guibg=NONE
	hi DiagnosticWarn guibg=NONE
	hi DiagnosticError guibg=NONE
	hi DiagnosticInfo guibg=NONE
]])
