vim.cmd([[
  autocmd FileType qf wincmd J
  packadd cfilter
]])

vim.o.mouse='a'
vim.o.clipboard='unnamedplus'
vim.o.number=true
vim.o.relativenumber=true
vim.o.smartindent=true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.wo.colorcolumn='80'
vim.o.ignorecase = true
vim.o.smartcase = true


local opts = { noremap=true, silent=true }
vim.keymap.set('n','<space>s',':update<CR>',opts)

vim.keymap.set('n','<space>co',':copen<CR>',opts)
vim.keymap.set('n','<space>cc',':ccl<CR>',opts)
vim.keymap.set('n','<space>cl',':cli<CR>',opts)

vim.keymap.set('n', '<space>lo',':lopen<CR>',opts)
vim.keymap.set('n', '<space>lc',':lcl<CR>',opts)
vim.keymap.set('n', '<space>ll',':lli<CR>',opts)

vim.keymap.set('t', '<Esc>','<C-\\><C-n>',opts)

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

-- color scheme
-- require'vscode_setup'
--
require'catppuccin_setup'
-- require'toggle-comment-highlight'.setup({foreground = '#dcdcaa'})

-- vim.cmd [[colorscheme gruvbox]]
-- --
--
-- -- toogle comment color
-- local comment_original_hi = vim.api.nvim_get_hl_by_name('Comment',true)
-- local comment_hi = {foreground = '#dcdcaa'}
--
-- function TOOGLE_COMMENT_HIGHLIGHT_COLOR()
--  local current_comment_hi = vim.api.nvim_get_hl_by_name('Comment',true)
--   if current_comment_hi.foreground == comment_original_hi.foreground then
--     vim.api.nvim_set_hl(0,'Comment',comment_hi)
--   else
--     vim.api.nvim_set_hl(0,'Comment',comment_original_hi)
--   end
-- end
--
--
