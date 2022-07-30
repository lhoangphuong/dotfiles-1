local default_colors = require("kanagawa.colors").setup()
local overrides = {
  VertSplit = { fg = 'pink', bg = "NONE" },
}

require 'kanagawa'.setup({
  overrides = overrides,
  transparent = true,
})

vim.cmd 'colorscheme kanagawa'
