vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init({
  git = {
        clone_timeout = 600, -- Timeout, in seconds, for git clones
  }
})
return packer.startup(function()

use 'wbthomason/packer.nvim'

-- color Theme
use {'Mofiqul/vscode.nvim', branch = 'main'}

-- Tree sitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'nvim-treesitter/playground'
use 'nvim-treesitter/nvim-treesitter-textobjects'

-- telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
}
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- git stuff
use 'tpope/vim-fugitive'
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
}

-- ThePrimeagen
use 'ThePrimeagen/git-worktree.nvim'

-- lsp stuff
use{ 'neovim/nvim-lspconfig'}
use{ 'j-hui/fidget.nvim'}

--flutter
use 'Neevash/awesome-flutter-snippets'
use {'huylg/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
use 'windwp/lsp-fastaction.nvim'

-- debug stuff
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

--rust
-- use 'simrat39/rust-tools.nvim'
--rescript-lang
use 'rescript-lang/vim-rescript'
use{ 'nkrkv/nvim-treesitter-rescript',run = ':TSInstall rescript' }

-- autocomplete
use{ 'hrsh7th/nvim-cmp'}
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'

-- tpope
use 'github/copilot.vim'
use 'tpope/vim-surround'
use 'tpope/vim-unimpaired'
use 'tpope/vim-sensible'
use 'tpope/vim-eunuch'
use 'tpope/vim-sleuth'
use 'tpope/vim-vinegar'


-- other plugins
use {"akinsho/toggleterm.nvim"}
use 'windwp/nvim-autopairs'
use {'mg979/vim-visual-multi', branch = 'master'}
use {'numToStr/Comment.nvim'}
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
use {
  "NTBBloodbath/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
  require("rest-nvim").setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Highlight request on run
	highlight = {
	  enabled = true,
	  timeout = 150,
	},
	result = {
	  -- toggle showing URL, HTTP info, headers at top the of result window
	  show_url = true,
	  show_http_info = true,
	  show_headers = true,
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = '.env',
	custom_dynamic_variables = {},
	yank_dry_run = true,
      })

  end
}
use {'norcalli/nvim-colorizer.lua',config = function() require'colorizer'.setup() end}
end)
