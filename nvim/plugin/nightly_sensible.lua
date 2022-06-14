if vim.version().minor >= 8 then
  vim.o.winbar = "%m %f"
  vim.cmd [[set cmdheight=0]]
end
