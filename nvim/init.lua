vim.o.termguicolors = true
vim.g.copilot_node_command = '/usr/local/opt/node@16/bin/node'
local ok, reload = pcall(require, 'plenary.reload')
RELOAD = ok and reload.reload_module or function(...)
  return ...
end
function R(name) RELOAD(name)
  return require(name)
end

R('plugins')
