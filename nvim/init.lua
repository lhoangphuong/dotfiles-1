local ok, reload = pcall(require, 'plenary.reload')
RELOAD = ok and reload.reload_module or function(...)
  return ...
end
function R(name)
  RELOAD(name)
  return require(name)
end

function R_all()
require ('plugins')
require ('settings')
require ('lspstuff')
require ('ts')
require ('comment_setup')
require ('cmp_setup')
require ('lualine_setup')
require ('fidget_setup')
require ('flutter')
require ('dap_setup')
require ('gitsigns_setup')
require ('telescope_setup')
require ('wev_devicons_setup')
require ('lsp-fastaction_setup')
require ('autopairs')
-- require ('git-worktree-setup')
end

R_all()
