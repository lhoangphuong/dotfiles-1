local function map(client,bufnr)

  vim.api.nvim_buf_set_option(bufnr,'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true, buffer=bufnr}

  vim.keymap.set('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '<space>la', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.keymap.set('n', '<space>qa', '<cmd>lua vim.diagnostic.setqflist({title="warnings",severity=vim.diagnostic.severity.WARN})<CR>', opts)
  vim.keymap.set('n', '<space>qe', '<cmd>lua vim.diagnostic.setqflist({severity=vim.diagnostic.severity.ERROR})<CR> <cmd>silent cr<CR>', opts)
  vim.keymap.set('n', '<space>a', '<cmd>lua vim.diagnostic.setqflist()<CR> <cmd>silent cr<CR>', opts)

  vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('v', '<space>a', '<esc><cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.keymap.set('n', '<space>lr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references({includeDeclaration=false})<CR>', opts)
  vim.keymap.set('n', "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  vim.keymap.set('n', "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set('n', "<space>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
  vim.keymap.set('n', "<space>ds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  vim.keymap.set('n','<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',opts)
  vim.keymap.set('n','<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',opts)

  if client.server_capabilities.document_highlight then
    vim.cmd 'autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()'
    vim.cmd 'autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()'
    vim.cmd 'autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()'
  end
end


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "single"
  }
)

return {map = map}
