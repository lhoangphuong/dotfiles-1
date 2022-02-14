-- Mappings.
local opts = { noremap=true, silent=true }

if vim.loop.cwd() == "/Users/TVG/admintool" then
  vim.api.nvim_set_keymap('n','<space>fa',':FlutterRun -t lib/main_staging.dart --no-sound-null-safety -d chrome --web-hostname 0.0.0.0 --web-port=7800<CR>',opts)
else
  vim.api.nvim_set_keymap('n','<space>fa',':FlutterRun',opts)
end

vim.api.nvim_set_keymap('n','<space>fq',':FlutterQuit<CR>',opts)
vim.api.nvim_set_keymap('n','<space>fc',':FlutterCopyProfilerUrl<CR>',opts)
vim.api.nvim_set_keymap('n','<space>fd',':FlutterDevices<CR>',opts)
vim.api.nvim_set_keymap('n','<space>fl',':FlutterLogClear<CR>',opts)
vim.api.nvim_set_keymap('n','<space>o' ,':FlutterOutlineToggle<CR>',opts)
vim.api.nvim_set_keymap('n','<Space>rl',':FlutterReload<CR>',opts)
vim.api.nvim_set_keymap('n','<space>fR',':FlutterRestart<CR>',opts)

require('lsp-fastaction').setup({
    hide_cursor = true,
    action_data = {
      --- action for filetype dart
        ['dart'] = {
            -- pattern is a lua regex with lower case
            { pattern = 'import library', key = 'i', order = 1 },
            { pattern = 'wrap with widget', key = 'w', order = 2 },
            { pattern = 'wrap with column', key = 'c', order = 3 },
            { pattern = 'wrap with row', key = 'r', order = 3 },
            { pattern = 'wrap with sizedbox', key = 's', order = 3 },
            { pattern = 'wrap with container', key = 'C', order = 4 },
            { pattern = 'wrap with center', key = 'E', order = 4 },
            { pattern = 'padding', key = 'P', order = 4 },
            { pattern = 'wrap with streambuilder', key = 'S', order = 5 },
            { pattern = 'remove', key = 'R', order = 5 },

            --range code action
            { pattern = "surround with %'if'", key = 'i', order = 2 },
            { pattern = 'try%-catch', key = 't', order = 2 },
            { pattern = 'for%-in', key = 'f', order = 2 },
            { pattern = 'setstate', key = 's', order = 2 },
        },
    },
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

function on_attach(_,bufnr)
  require("telescope").load_extension("flutter")

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua require("lsp-fastaction").code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>la', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>qa', '<cmd>lua vim.diagnostic.setqflist({title="warnings",severity=vim.diagnostic.severity.WARN})<CR>', opts)
  buf_set_keymap('n', '<space>qe', '<cmd>lua vim.diagnostic.setqflist({severity="Error"})<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  buf_set_keymap('n', "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap('n', "<space>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
  buf_set_keymap('n', "<space>ds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
-- alternatively you can override the default configs
end

require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = false,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = false,
    }
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps

    register_configurations = function(paths)

    require('dap').adapters.dart = {
      type = "executable",
      command = "node",
      args = {vim.fn.stdpath('config').."/nvim/Dart-Code/out/dist/debug.js", "flutter"}
    }

    require("dap").configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = paths.dart_sdk,
          flutterSdkPath = paths.flutter_sdk,
          program = "${workspaceFolder}/lib/main_staging.dart",
          cwd = "${workspaceFolder}",
	  args = {'--no-sound-null-safety'}
        },
        {
          type = "dart",
          request = "attach",
          name = "Connect flutter",
          dartSdkPath = paths.dart_sdk,
          flutterSdkPath = paths.flutter_sdk,
          program = "${workspaceFolder}/lib/main_staging.dart",
          cwd = "${workspaceFolder}",
	  args = {'--no-sound-null-safety'}
        },
    }
    end,
  },
  -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    -- highlight = "ErrorMsg", -- highlight for the closing tag
    -- prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    enabled = true,
    open_cmd = "vnew", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = true, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true,
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    on_attach = on_attach,
    capabilities = capabilities, -- e.g. lsp_status capabilities
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      -- analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
    }
  }
}
