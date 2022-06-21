-- Lua initialization file
vim.g.nightflyTransparent = 1
vim.cmd [[
	colorscheme nightfly
	hi! CursorLine gui=underline cterm=underline guibg=none
	hi CursorLineNr guibg=NONE
	hi WinSeparator guibg=none guifg=#c0caf5
	hi FLoatBorder guibg=none guifg=#c0caf5
	hi clear Visual
	hi PmenuSel guifg=NONE
	hi link Visual PmenuSel
	hi link GitSignsCurrentLineBlame Comment
]]
