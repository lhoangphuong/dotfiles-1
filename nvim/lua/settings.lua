vim.cmd([[
  set completeopt=menu,menuone,noselect
  set mouse=a
  set clipboard=unnamed
  set number
  set relativenumber
  set smartindent
  set colorcolumn=80

  " set smartcase
  " set ignorecase
  " set shiftwidth=2
  " autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2

  autocmd FileType qf wincmd J

  so ~/.config/nvim/vim/vscode.vim
  so ~/.config/nvim/vim/vsnip.vim
  " so ~/.config/nvim/vim/copilot.vim

  packadd cfilter
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

function remove_qf_list()
  local qflist = vim.fn.getqflist();
  for _, item in ipairs(qflist) do
    vim.api.nvim_buf_set_lines(item.bufnr,item.lnum-1,item.lnum,false,{''})
  end
end
