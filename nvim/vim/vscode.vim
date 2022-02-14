set termguicolors
let g:vscode_style = "dark"
colorscheme vscode


hi Normal guibg=#1a1b26 ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi NvimTreeNormal guibg=NONE
hi BufferTabpageFill guibg=none
hi CursorLineNr guibg=NONE 
hi LspDiagnosticsUnderlineInformation guifg=NONE
hi LspDiagnosticsUnderlineError guifg=NONE

hi NvimTreeCursorline gui=underline cterm=underline guibg=NONE
hi Comment gui=italic
hi link GitSignsCurrentLineBlame Comment
hi NvimTreeFolderIcon guibg=blue

set cursorline
hi clear CursorLine
hi! CursorLine gui=underline cterm=underline


hi FidgetTitle ctermfg=110 guifg=#6cb6eb guibg=none ctermbg=NONE
hi FidgetTask guibg=none guifg=#D4D4D4 ctermbg=NONE
hi CopilotSuggestion guifg=#f19494

hi GitSignsDeleteLn guifg=#F44747 guibg=NONE
hi GitSignsAddLn guifg=#6A9955 guibg=NONE
