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
-- vim.o.cursorcolumn = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.cmd 'set noswapfile'


vim.keymap.set('n','<C-s>',':update<CR>',{noremap=true,silent=true,desc='[S]ave'})

vim.keymap.set('n','<space>co',':copen<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<space>cc',':ccl<CR>',{noremap=true,silent=true})
vim.keymap.set('n','<space>cl',':cli<CR>',{noremap=true,silent=true})

vim.keymap.set('n', '<space>lo',':lopen<CR>',{noremap=true,silent=true})
vim.keymap.set('n', '<space>lc',':lcl<CR>',{noremap=true,silent=true})
vim.keymap.set('n', '<space>ll',':lli<CR>',{noremap=true,silent=true})

vim.keymap.set('t', '<Esc>','<C-\\><C-n>',{noremap=true,silent=true})

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
  require 'catppuccin_setup'
  vim.wo.colorcolumn='80'
else
  require 'default_scheme'
end

-- require 'default_scheme'
-- color scheme
-- require'vscode_setup'
--
-- require'catppuccin_setup'
-- require'toggle-comment-highlight'.setup({foreground = '#dcdcaa'})

-- require 'gruvbox_setup'
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
