local nvim_lsp = require('lspconfig')
local lsp_mapping = require'lsp_mapping'.map

local servers = {'hls','tsserver','elmls','sumneko_lua',}
for _, lsp in ipairs(servers) do
   nvim_lsp[lsp].setup {
     on_attach = lsp_mapping,
     flags = {
       debounce_text_changes = 150,
     },
    settings = {
	  Lua = {
	      diagnostics = {
		  globals = {'vim'}
	      }
	  }
      }
   }
 end

nvim_lsp['rescriptls'].setup {
     on_attach = lsp_mapping,
  flags = {
    debounce_text_changes = 150,
  },
 cmd = {
   'node',
    string.format('%s/site/pack/packer/start/vim-rescript/server/out/server.js',vim.fn.stdpath('data')),
    '--stdio'
  },
 }


nvim_lsp['dartls'].setup {
  on_attach = function (client,bufnr)
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
    local command = 'Dispatch! tmux send-keys -t admintool-flutter-run.1 '..key;
    vim.cmd(command);
  end

  vim.keymap.set('n','<space>fk',':lua SendKeyToFlutterTmux()<CR>',opts)
  end,
  flags = {
    debounce_text_changes = 150,
  },
 }

