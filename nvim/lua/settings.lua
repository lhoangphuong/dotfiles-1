vim.cmd([[
  set completeopt=menu,menuone,noselect
  set mouse=a
  set clipboard=unnamed
  set number
  set relativenumber
  set shiftwidth=2
  set smartindent
  autocmd FileType qf wincmd J

  autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
  so ~/.config/nvim/vim/vscode.vim
  so ~/.config/nvim/vim/vsnip.vim
  so ~/.config/nvim/vim/copilot.vim
]])

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('i','<C-b>','<left>',opts)
vim.api.nvim_set_keymap('i','<C-f>','<right>',opts)

vim.api.nvim_set_keymap('n','<space>s',':update<CR>',opts)

vim.api.nvim_set_keymap('n','<space>co',':copen<CR>',opts)
vim.api.nvim_set_keymap('n','<space>cc',':ccl<CR>',opts)
vim.api.nvim_set_keymap('n','<space>cl',':cli<CR>',opts)

vim.api.nvim_set_keymap('n', '<space>lo',':lopen<CR>',opts)
vim.api.nvim_set_keymap('n', '<space>lc',':lcl<CR>',opts)
vim.api.nvim_set_keymap('n', '<space>ll',':lli<CR>',opts)

vim.api.nvim_set_keymap('t', '<Esc>','<C-\\><C-n>',opts)

vim.api.nvim_set_keymap('n','<leader><CR>',":lua require('rest-nvim').run()<CR>",opts)
