local function map(client,bufnr)

  vim.api.nvim_buf_set_option(bufnr,'omnifunc', 'v:lua.vim.lsp.omnifunc')
local opts = { noremap=true, silent=true, buffer=bufnr}

  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>la', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<space>qa', function()
    vim.diagnostic.setqflist({title="warnings",
    severity=vim.diagnostic.severity.WARN})
  end, opts)
  vim.keymap.set('n', '<space>qe',function ()
    vim.diagnostic.setqflist({severity=vim.diagnostic.severity.ERROR})
  end , opts)
  vim.keymap.set('n', '<space>a',  vim.diagnostic.setqflist, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', vim.lsp.buf.list_workspace_folders, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('v', '<space>a', vim.lsp.buf.range_code_action, opts)
  vim.keymap.set('n', '<space>lr', vim.lsp.codelens.run, opts)
  vim.keymap.set('n', 'gr',function ()
    vim.lsp.buf.references({includeDeclaration=false})
  end , opts)
  vim.keymap.set('n', "<space>fm", function ()
    vim.lsp.buf.format({async = true})
  end, opts)
  vim.keymap.set('n', "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set('n', "<space>ws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set('n', "<space>ds", vim.lsp.buf.document_symbol, opts)
  vim.keymap.set('n','<space>wl', vim.lsp.buf.list_workspace_folders,opts)
  vim.keymap.set('n','<space>D', vim.lsp.buf.type_definition,opts)

  if client.server_capabilities.document_highlight then
    vim.cmd 'autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight'
    vim.cmd 'autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight'
    vim.cmd 'autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references'
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
