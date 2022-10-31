local nvim_lsp = require('lspconfig')
local lsp_mapping = require 'lsp_mapping'.map

local servers = { 'hls',
	'tsserver',
	'elmls',
	'sumneko_lua',
	-- 'clangd',
	'pyright',
	'sourcekit',
	'cucumber_language_server',
	'ocamllsp'
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = lsp_mapping,
		flags = {
			debounce_text_changes = 150,
		},
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
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
		string.format('%s/site/pack/packer/start/vim-rescript/server/out/server.js', vim.fn.stdpath('data')),
		'--stdio'
	},
}
