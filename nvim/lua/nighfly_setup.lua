vim.g.nightflyWinSeparator = 2
vim.g.nightflyTransparent = false
vim.cmd [[
    colorscheme nightfly
    hi! CursorLine gui=underline cterm=underline guibg=none
    hi link DiagnosticVirtualTextError NightflyRed 
    hi link DiagnosticVirtualTextWarn NightflyYellow
    hi link DiagnosticVirtualTextHint NightflyWhite
    hi link DiagnosticVirtualTextInfo NightflyBlue
    hi Winbar guibg=none guifg=#21c7a8
    hi WinbarNC guibg=none 
    hi statusline guibg=none 
  ]]
