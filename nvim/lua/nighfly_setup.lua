vim.g.nightflyWinSeparator = 2
vim.g.nightflyTransparent = false
vim.cmd.colorscheme 'nightfly'
vim.api.nvim_set_hl(0, 'CursorLine', { underline = false, bg = nil })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { link = 'NightflyRed' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { link = 'NightflyYellow' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { link = 'NightflyWhite' })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { link = 'NightflyBlue' })
vim.api.nvim_set_hl(0, 'Winbar', { bg = nil, fg = '#21c7a8' })
vim.api.nvim_set_hl(0, 'WinbarNC', { bg = nil })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = nil })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = 'pink' })
