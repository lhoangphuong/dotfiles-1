local ok, reload = pcall(require, 'plenary.reload')
RELOAD = ok and reload.reload_module or function(...)
  return ...
end
function R(name)
  RELOAD(name)
  return require(name)
end

function R_all()
R ('plugins')
R ('settings')
R ('lspstuff')
R ('ts')
R ('comment_setup')
R ('cmp_setup')
R ('lualine_setup')
R ('fidget_setup')
R ('flutter')
R ('dap_setup')
R ('gitsigns_setup')
R ('toggleterm_setup')
R ('telescope_setup')
R ('wev_devicons_setup')
R ('lsp-fastaction_setup')
R ('autopairs')
end

R_all()
