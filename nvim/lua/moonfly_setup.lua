vim.g.moonflyWinSeparator = 2
vim.cmd [[
    colorscheme moonfly
    hi! CursorLine gui=underline cterm=underline guibg=none
    hi link DiagnosticVirtualTextError MoonflyRed 
    hi link DiagnosticVirtualTextWarn MoonflyYellow
    hi link DiagnosticVirtualTextHint MoonflyWhite
    hi link DiagnosticVirtualTextInfo MoonflyBlue
  ]]
