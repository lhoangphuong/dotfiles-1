if vim.version().minor >= 8 then
  vim.o.winbar = "%m %f"
  vim.cmd [[set cmdheight=0]]
  local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
  local cwd = vim.fs.normalize(vim.fn.getcwd())
  local nvim_dir = vim.fs.normalize('$DOTFILE_DIR/nvim')

  if cwd == nvim_dir then
    vim.api.nvim_create_autocmd('BufWritePost',
      { command = [[ source <afile> | PackerCompile ]],
        group = packer_group, pattern = '**/*.lua' })
  end
end
