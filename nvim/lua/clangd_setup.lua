require("clangd_extensions").setup {
  server = {
    -- options to pass to nvim-lspconfig
    -- i.e. the arguments to require("lspconfig").clangd.setup({})
    on_attach = function(client, bufnr)

      vim.api.nvim_create_user_command('ClangdRun', function()
        local current_file = vim.fn.expand('%')

        vim.cmd 'set norelativenumber'
        vim.cmd("call MonkeyTerminalExecZsh('make target=" .. current_file .. "')")
      end, {})

      -- 1. build app with debug flag
      -- 2. make debug
      -- 3. start lldb with app
      -- 4. set breakpoint add current line
      -- 5. lldb run
      vim.api.nvim_create_user_command('ClangdDebug', function()
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        local current_file = vim.fn.expand('%')

        vim.cmd 'set relativenumber!'

        local make_command = 'make debug target=' .. current_file .. '; '
        local lldb_command = 'lldb a.out '

        vim.cmd('call MonkeyTerminalExecZsh(' .. "\'" .. make_command .. lldb_command .. "\'" .. ')')

        local set_breakpoint_command = 'b ' .. current_line;

        vim.cmd('call MonkeyTerminalExec(' .. "\'" .. set_breakpoint_command .. "\'" .. ')')
        vim.cmd [[
          call MonkeyTerminalExec('r')
        ]]
      end, {})

      require 'lsp_mapping'.map(client, bufnr)
    end,
    flags = {
      debounce_text_changes = 150,
    },
  },
  extensions = {
    -- defaults:
    -- Automatically set inlay hints (type hints)
    autoSetHints = true,
    -- These apply to the default ClangdSetInlayHints command
    inlay_hints = {
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause  higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7,
      -- The color of the hints
      highlight = "Comment",
      -- The highlight group priority for extmark
      priority = 100,
    },
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },

      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },

      highlights = {
        detail = "Comment",
      },
    },
    memory_usage = {
      border = "none",
    },
    symbol_info = {
      border = "none",
    },
  },
}
