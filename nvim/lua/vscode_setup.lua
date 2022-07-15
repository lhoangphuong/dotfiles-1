-- For dark theme (neovim's default)
vim.o.background = "dark"
-- Enable transparent background
vim.g.vscode_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color

vim.cmd([[
	colorscheme vscode
	hi! CursorLine gui=underline cterm=underline guibg=none
]])
