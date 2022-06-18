vim.cmd [[
  colorscheme default
  hi clear SignColumn
  hi DiffAdd ctermbg=none ctermfg=green
  hi DiffDelete ctermbg=none ctermfg=red
  hi DiffChange ctermbg=none ctermfg=yellow
  hi link NormalFloat  Normal
  hi link CmpItemAbbrMatch Special
  hi link CmpItemAbbrMatchFuzzy Special
]]
