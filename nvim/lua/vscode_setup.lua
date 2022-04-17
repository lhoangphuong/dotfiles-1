vim.g.vscode_italic_comment = 1
vim.g.vscode_style = "dark"

vim.cmd([[
colorscheme vscode
hi Normal guibg=#1a1b26 ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi BufferTabpageFill guibg=none
hi LspDiagnosticsUnderlineInformation guifg=NONE
hi LspDiagnosticsUnderlineError guifg=NONE

hi Comment gui=italic
hi link GitSignsCurrentLineBlame Comment

hi FidgetTitle ctermfg=110 guifg=#6cb6eb guibg=none ctermbg=NONE
hi FidgetTask guibg=none guifg=#D4D4D4 ctermbg=NONE
hi CopilotSuggestion guifg=#e5e3f7
hi GitSignsDeleteLn guifg=#F44747 guibg=NONE
hi GitSignsAddLn guifg=#6A9955 guibg=NONE

hi WinSeparator guibg=none guifg=#c0caf5

hi ColorColumn guibg=#2A2A37
hi CursorColumn guibg=#363646

hi! CursorLine gui=underline cterm=underline guibg=none
hi CursorLineNr guibg=NONE
]])
