local lsp = vim.lsp.buf
local handlers = vim.lsp.handlers
local diagnostic = vim.diagnostic
local M = {}
M.map = function(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<space>e', diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>la', diagnostic.setloclist, opts)
  vim.keymap.set('n', '<space>qa', function()
    vim.keymap.set('n', '<space>a', diagnostic.setqflist, opts)
    diagnostic.setqflist({ title = "warnings",
      severity = diagnostic.severity.WARN })
  end, opts)
  vim.keymap.set('n', '<space>qe', function()
    diagnostic.setqflist({ severity = diagnostic.severity.ERROR })
  end, opts)
  vim.keymap.set('n', 'gD', lsp.declaration, opts)
  vim.keymap.set('n', 'gd', lsp.definition, opts)
  vim.keymap.set('n', 'K', lsp.hover, opts)
  vim.keymap.set('n', 'gi', lsp.implementation, opts)
  vim.keymap.set('n', '<C-k>', lsp.signature_help, opts)
  vim.keymap.set('n', '<space>wa', lsp.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', lsp.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', lsp.list_workspace_folders, opts)
  vim.keymap.set('n', '<space>D', lsp.type_definition, opts)
  vim.keymap.set('n', '<space>ca', lsp.code_action, opts)
  vim.keymap.set('v', '<space>a', lsp.range_code_action, opts)
  vim.keymap.set('n', '<space>lr', vim.lsp.codelens.run, opts)
  vim.keymap.set('n', 'gr', function()
    lsp.references({ includeDeclaration = false })
  end, opts)
  vim.keymap.set('n', "<space>fm", function()
    lsp.format({ async = true })
  end, opts)
  vim.keymap.set('n', "<space>rn", lsp.rename, opts)
  vim.keymap.set('n', "<space>ws", lsp.workspace_symbol, opts)
  vim.keymap.set('n', "<space>ds", lsp.document_symbol, opts)
  vim.keymap.set('n', '<space>wl', lsp.list_workspace_folders, opts)
  vim.keymap.set('n', '<space>D', lsp.type_definition, opts)

  if client.server_capabilities.document_highlight then
    vim.cmd [[
      autocmd CursorHold  <buffer> lua lsp.document_highlight
      autocmd CursorHoldI <buffer> lua lsp.document_highlight
      autocmd CursorMoved <buffer> lua lsp.clear_references
    ]]
  end
end


handlers["textDocument/hover"] = vim.lsp.with(
  handlers.hover, {
  border = "single"
}
)

handlers["textDocument/signatureHelp"] = vim.lsp.with(
  handlers.signature_help, {
  border = "single"
}
)

return M
