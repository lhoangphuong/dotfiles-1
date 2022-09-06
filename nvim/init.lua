-- feature for cp programming
local current_workspace = vim.fn.getcwd();
local cp_path = vim.fs.normalize('$HOME/personal/algo_and_ds')
vim.g.cp_flag = string.find(current_workspace, cp_path, 1, true)

vim.o.termguicolors = not vim.g.cp_flag
vim.g.copilot_node_command = '/usr/local/opt/node@16/bin/node'
local ok, reload = pcall(require, 'plenary.reload')
RELOAD = ok and reload.reload_module or function(...)
  return ...
end
function R(name) RELOAD(name)
  return require(name)
end

R('plugins')
