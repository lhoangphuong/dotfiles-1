-- Mappings.
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function on_attach(client,bufnr)
  require("telescope").load_extension("flutter")

  local opts = { noremap=true, silent=true,buffer=bufnr }

  local admintool_path = vim.fn.getenv('HOME')..'/admintool'

  if vim.loop.cwd() == admintool_path then
    -- vim.keymap.set('n','<space>fa',':FlutterRun -t lib/int5.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800<CR>',opts)
    vim.keymap.set('n','<space>fa',':!zsh $HOME/dotfiles/tmux-workspace-script/flutter-run-admintool.sh<CR>',opts)
  else
    vim.keymap.set('n','<space>fa',':FlutterRun',opts)
  end

  -- vim.keymap.set('n','<space>fq',':FlutterQuit<CR>',opts)
  -- vim.keymap.set('n','<space>fc',':FlutterCopyProfilerUrl<CR>',opts)
  -- vim.keymap.set('n','<space>fd',':FlutterDevices<CR>',opts)
  -- vim.keymap.set('n','<space>fl',':FlutterLogClear<CR>',opts)
  -- vim.keymap.set('n','<space>o' ,':FlutterOutlineToggle<CR>',opts)
  -- vim.keymap.set('n','<Space>rl',':FlutterReload<CR>',opts)
  -- vim.keymap.set('n','<space>fR',':FlutterRestart<CR>',opts)
  -- vim.keymap.set('n','<space>fc',':Telescope flutter commands<CR>',opts)

  vim.keymap.set('n','<space>fq',':!zsh $HOME/dotfiles/tmux-workspace-script/flutter-stop-admintool.sh<CR>',opts)
  vim.keymap.set('n','<space>ft',':Dispatch flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d web-server --verbose <CR>',opts)
  vim.keymap.set('n','<space>dm',':DartFmt<CR>',opts)

  require'lsp_mapping'.map(client,bufnr)

  function SendKeyToFlutterTmux()
    local message = [[v Open Flutter DevTools.
w Dump widget hierarchy to the console.                                               (debugDumpApp)
t Dump rendering tree to the console.                                          (debugDumpRenderTree)
L Dump layer tree to the console.                                               (debugDumpLayerTree)
S Dump accessibility tree in traversal order.                                   (debugDumpSemantics)
U Dump accessibility tree in inverse hit test order.                            (debugDumpSemantics)
i Toggle widget inspector.                                  (WidgetsApp.showWidgetInspectorOverride)
p Toggle the display of construction lines.                                  (debugPaintSizeEnabled)
I Toggle oversized image inversion.                                     (debugInvertOversizedImages)
o Simulate different operating systems.                                      (defaultTargetPlatform)
b Toggle platform brightness (dark and light mode).                        (debugBrightnessOverride)
P Toggle performance overlay.                                    (WidgetsApp.showPerformanceOverlay)
a Toggle timeline events for all widget build methods.                    (debugProfileWidgetBuilds)
g Run source code generators.                                              (debugDumpGeneratedCode)

Enter key to send to flutter: ]]

    local key = vim.fn.input(message)
    local command = 'Dispatch tmux send-keys -t admintool-flutter-run.1 '..key;
    vim.cmd(command);
  end

  vim.keymap.set('n','<space>fk',':lua SendKeyToFlutterTmux()<CR>',opts)
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
      app_version = true,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = true,
    }
  },
   debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
    register_configurations = function(paths)

    require("dap").configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = paths.dart_sdk,
          flutterSdkPath = paths.flutter_sdk,
          program = "${workspaceFolder}/lib/main_staging.dart",
          cwd = "${workspaceFolder}",
	  args = {'-d','chrome'}
        },
        {
          type = "dart",
          request = "attach",
          name = "Connect flutter",
          dartSdkPath = paths.dart_sdk,
          flutterSdkPath = paths.flutter_sdk,
          program = "${workspaceFolder}/lib/main_staging.dart",
          cwd = "${workspaceFolder}",
	  args = {'-d','chrome'}
        },
    }
    end,
  },
  -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = true,
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
