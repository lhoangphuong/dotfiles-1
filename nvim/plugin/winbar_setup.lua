function treesitter_context()
  if not packer_plugins["nvim-treesitter"] or packer_plugins["nvim-treesitter"].loaded == false then
    return "load nvim-treesitter failed or not"
  end
  local type_patterns = {
    "class",
    "function",
    "method",
    "interface",
    "type_spec",
    "table",
    "if_statement",
    "for_statement",
    "for_in_statement",
    "call_expression",
    "comment",
    "selector",
    "argument_part",
    "arguments",
    "label",
    "identifier"
  }

  if vim.o.ft == "json" then
    type_patterns = { "object", "pair" }
  end

  local f = require("nvim-treesitter").statusline({
    indicator_size = vim.api.nvim_get_option("columns");
    type_patterns = type_patterns,
  })
  local context = string.format("%s", f) -- convert to string, it may be a empty ts node

  -- lprint(context)
  if context == "vim.NIL" then
    return "meow"
  end

  return '%f -> ' .. context
end

if vim.version().minor >= 8 then
   vim.o.winbar = "%{%v:lua.treesitter_context()%}"
end
