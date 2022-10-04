vim.cmd([[
  autocmd FileType qf wincmd J
  packadd cfilter

  let g:copilot_filetypes = {
  \ 'cpp': v:false,
  \ 'dap-repl': v:false,
  \ }
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
vim.cmd 'set cmdheight=0'


vim.keymap.set('n', '<C-s>', ':update<CR>', { noremap = true, silent = true, desc = '[S]ave' })

vim.keymap.set('n', '<space>co', ':copen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>cc', ':ccl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>cl', ':cli<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<space>lo', ':lopen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>lc', ':lcl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>ll', ':lli<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- reselect pasted text
vim.keymap.set('n', 'gp', '`[v`]')

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
else
  require 'default_scheme'
end

vim.api.nvim_create_user_command('JwtParser', function()
  vim.cmd "call MonkeyTerminalExecZsh('jwt decode $(pbpaste) | jid')"
end, {})

vim.api.nvim_create_user_command('Touch', function(data)
  local create_command = 'silent !touch ' .. data.args;

  vim.cmd(create_command)

  -- open buffer with new file
  vim.cmd('e ' .. data.args)


end, { nargs = "*" })

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
local cwd = vim.fs.normalize(vim.fn.getcwd())
local nvim_dir = vim.fs.normalize('$DOTFILE_DIR/nvim')

if cwd == nvim_dir then
  vim.api.nvim_create_autocmd('BufWritePost',
    { command = [[ source <afile> | PackerCompile ]],
      group = packer_group, pattern = '**/*.lua' })
end
