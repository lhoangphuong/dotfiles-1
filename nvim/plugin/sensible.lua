vim.cmd([[
  autocmd FileType qf wincmd J
  packadd cfilter
]])

vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorcolumn = false
vim.wo.colorcolumn = 0
vim.cmd 'set noswapfile'


vim.keymap.set('n', '<C-s>', ':update<CR>', { noremap = true, silent = true, desc = '[S]ave' })

vim.keymap.set('n', '<space>co', ':copen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>cc', ':ccl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>cl', ':cli<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<space>lo', ':lopen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>lc', ':lcl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>ll', ':lli<CR>', { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

if vim.o.termguicolors then
  require 'nighfly_setup'
  -- require 'moonfly_setup'
else
  require 'default_scheme'
end
