-- Mappings.
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.api.nvim_create_user_command('Send', function()
	local params = vim.lsp.util.make_range_params()

	local clients = vim.lsp.get_active_clients({ name = "dartls" })
	for _, client in ipairs(clients) do
		client.request("textDocument/inlayHint", params, nil, 0);
	end
end, {})

local current_workspace = vim.fn.getcwd();
local sdk_path = vim.fs.normalize('$HOME/elca-workspace/tyxr-app-sdk')
local admintool_path = vim.fs.normalize('$HOME/elca-workspace/tixngo-admintool-flutter-2')
local flutter_run_command = ':FlutterRun'

if string.find(current_workspace, sdk_path, 1, true) then
	flutter_run_command = 'FlutterRun --host-vmservice-port 8000 --disable-service-auth-codes --fast-start'
elseif current_workspace == admintool_path then
	flutter_run_command = 'FlutterRun -t lib/main_development.dart -d chrome --web-hostname 0.0.0.0 --web-port=7800'
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>fl', vim.cmd.FlutterLogClear, opts)
vim.keymap.set('n', '<space>fw', function()
	vim.cmd.FlutterSendRawKey 'w'
end, opts)
vim.keymap.set('n', '<space>fa', function()
	vim.cmd(flutter_run_command)
end, opts)
vim.keymap.set('n', '<space>fq', vim.cmd.FlutterQuit, opts)
vim.keymap.set('n', '<space>fo', vim.cmd.FlutterLogOpen, opts)

local function on_attach(client, bufnr)
	require("telescope").load_extension("flutter")

	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', '<Space>fr', vim.cmd.FlutterReload, opts)
	vim.keymap.set('n', '<space>fR', vim.cmd.FlutterRestart, opts)

	vim.keymap.set('n', '<space>fc', function()
		vim.cmd.Telescope { 'flutter', 'commands' }
	end, opts)

	vim.api.nvim_create_user_command('FlutterPubGetSDK', function()
		vim.cmd.Dispatch 'cd $HOME/elca-workspace/tyxr-app-sdk/modules && fpga; cd $HOME/elca-workspace/tyxr-app-sdk/branded_app/tixngo_show && fpg'
	end, {})
	vim.api.nvim_create_user_command('FlutterRunFile', function()
		vim.cmd.FlutterRun(vim.fn.expand('%'))
	end, {})
	vim.api.nvim_create_user_command('FlutterLogOpen', function()
		vim.cmd.sb '__FLUTTER_DEV_LOG__'
	end, {})
	vim.api.nvim_create_user_command('GrantPermission', function()
		vim.cmd('Dispatch! ~/dotfiles/bin/grant-permission-android-app')
	end, {})
	vim.api.nvim_create_user_command('UnlockScreen', function()
		vim.cmd('Dispatch! ~/dotfiles/bin/unlock_screen_android')
	end, {})
	vim.api.nvim_create_user_command('UninstallApp', function()
		vim.cmd.Dispatch 'uninstall-android-app'
	end, {})
	vim.api.nvim_create_user_command('InstallApp', function()
		vim.cmd.Dispatch 'install-android-app'
	end, {})
	vim.api.nvim_create_user_command('ReinstallApp', function()
		vim.cmd.Dispatch { 'uninstall-android-app;', 'install-android-app' }
	end, {})
	vim.api.nvim_create_user_command('AdbShell', function()
		vim.cmd.Start { 'adb', 'shell' }
	end, {})
	vim.api.nvim_create_user_command('GetFile', function()
		vim.cmd.Dispatch 'get-file-android-app'
	end, {})
	vim.api.nvim_create_user_command('WriteFile', function(data)
		local email = data.args;
		vim.cmd.Dispatch { '~/dotfiles/bin/write-file-android-app', email, '123456789' }
		vim.cmd.FlutterRestart()
	end, { nargs = '*' })
	if flutter_run_command == ':FlutterRun' then
		vim.b.dispatch = 'dart run'
	else
		vim.b.dispatch = 'flutter test integration_test/'
	end

	vim.api.nvim_create_user_command('FlutterRoute', function(data)
		if data.args == "" then
			vim.ui.input({ prompt = 'Enter route: ' }, function(input)
				local command = flutter_run_command .. ' --route=' .. input;
				print(command)
				vim.cmd(command)
			end)
		else
			local command = flutter_run_command .. ' --route ' .. data.args;
			print(command)
			vim.cmd(command)
		end
	end, { nargs = "*" })


	vim.api.nvim_create_user_command('FlutterBuildRunner', function()
		vim.cmd.Dispatch 'flutter pub get; flutte pub run build_runner build --delete-conflicting-outputs'
	end, {})
	vim.api.nvim_create_user_command('FlutterCleanBuildRunner', function()
		vim.cmd.Dispatch 'flutter pub get; flutter pub run build_runner clean; flutter pub run build_runner build --delete-conflicting-outputs'
	end, {})
	vim.api.nvim_create_user_command('FlutterAnalyze', function()
		vim.cmd.Dispatch 'flutter analyze'
	end, {})
	vim.api.nvim_create_user_command('FlutterGenL10n', function()
		vim.cmd.Dispatch 'flutter pub run intl_translation:generate_from_arb'
	end, {})
	vim.api.nvim_create_user_command('FlutterRunWithoutBuild', function()
		vim.cmd.FlutterRun '--use-application-binary=build/app/outputs/flutter-apk/app-debug.apk'
	end, {})
	require 'lsp_mapping'.map(client, bufnr)

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
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline this will show the currently running device if an application was started with a specific device
			device = true,
		}
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
		enabled = false,
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
					args = { '-d', 'chrome' }
				},
				{
					type = "dart",
					request = "attach",
					name = "Connect flutter",
					dartSdkPath = paths.dart_sdk,
					flutterSdkPath = paths.flutter_sdk,
					program = "${workspaceFolder}/lib/main_staging.dart",
					cwd = "${workspaceFolder}",
					args = { '-d', 'chrome' }
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
		open_cmd = "new", -- command to use to open the log buffer
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
			renameFilesWithClasses = 'always',
			updateImportsOnRename = true,
			enableSnippets = true,
		}
	}
}
