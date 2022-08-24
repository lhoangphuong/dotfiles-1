-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'

require('vscode').setup({
  -- Enable transparent background
  transparent = true,

  -- Enable italic comment
  italic_comments = true,

  -- Disable nvim-tree background color
  disable_nvimtree_bg = true,
})

vim.cmd [[
  colorscheme vscode
  hi! CursorLine gui=underline cterm=underline guibg=none
  hi Winbar guibg=none guifg=#9CDCFE
  hi WinbarNC guibg=none 
]]
