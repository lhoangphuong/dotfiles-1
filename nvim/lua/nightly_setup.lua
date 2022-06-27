-- Lua initialization file
vim.g.nightflyTransparent = true
vim.cmd [[
	colorscheme nightfly
	hi CursorLineNr guibg=NONE
	hi WinSeparator guibg=none guifg=#c0caf5
	hi FLoatBorder guibg=none guifg=#c0caf5
	hi clear Visual
	hi clear WinBar
	hi clear WinBarNC
	hi PmenuSel guifg=NONE
	hi link Visual PmenuSel
	hi link GitSignsCurrentLineBlame Comment
	hi Comment guifg=#949494
	hi! CursorLine gui=underline cterm=underline guibg=none
]]
