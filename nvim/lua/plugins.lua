local packer_notify = function(msg, level)
  vim.notify(msg, level, { title = 'Packer' })
end
local fn = vim.fn
local fmt = string.format

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_notify 'Downloading packer.nvim...'
  packer_notify(
    fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
      install_path }
  )
  vim.cmd 'packadd! packer.nvim'
  require('packer').sync()
else
  vim.cmd(fmt('packadd! %s', 'packer.nvim'))
end


vim.keymap.set('n', '<leader>ps', function()
  vim.cmd 'PackerSync'
end, { noremap = true,
  silent = false })
vim.keymap.set('n', '<leader>pc', function()
  vim.cmd 'PackerClean'
end, { noremap = true,
  silent = false })

local packer = require('packer')
packer.init({
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  luarocks = {
    python_cmd = 'python3' -- Set the python command to use for running hererocks
  },
})
return packer.startup(function(use)


  use 'wbthomason/packer.nvim'
  -- color Theme
  use 'bluz71/vim-nightfly-guicolors'
  use 'bluz71/vim-moonfly-colors'
  -- Tree sitter

  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function()
      require 'ts'
    end,
    requires = {
      { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
      { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
      { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
      { 'nkrkv/nvim-treesitter-rescript', run = ':TSInstall rescript', after = 'nvim-treesitter' }
    },
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'telescope_setup'
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-ui-select.nvim', after = 'telescope.nvim',
        config = function()
          require 'telescope'.load_extension('ui-select')
        end
      },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after =
      'telescope.nvim', config = function()
        require('telescope').load_extension('fzf')
      end
      },
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- git stuff
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require 'gitsigns_setup'
    end
  }

  -- lsp stuff
  use { 'neovim/nvim-lspconfig', config = function()
    require 'lspstuff'
  end }
  use({
    "andrewferrier/textobj-diagnostic.nvim",
    config = function()
      require("textobj-diagnostic").setup()
    end,
  })
  use {
    'SmiteshP/nvim-navic',
    requires = 'neovim/nvim-lspconfig'
  }

  --flutter
  use {
    'huylg/flutter-tools.nvim', requires = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'dart-lang/dart-vim-plugin',
      'Neevash/awesome-flutter-snippets',
    },
    ft = { 'dart', 'feature', 'yaml', 'lua' },
    config = function()
      require 'flutter'
    end
  }
  use {
    'akinsho/pubspec-assist.nvim',
    requires = 'plenary.nvim',
    rocks = {
      {
        'lyaml',
        server = 'http://rocks.moonscript.org',
        env = { YAML_DIR = '/usr/local/Cellar/libyaml/0.2.5/' },
      },
    },
    config = function()
      require('pubspec-assist').setup()
    end,
  }
  use({
    'nvim-neotest/neotest',
    requires = {
      'huylg/neotest-dart',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim'
    },
    config = function()
      require 'neotest_setup'
    end
  })


  -- debug stuff
  use { 'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      after = 'nvim-dap', config = function()
        require 'dap_setup'
      end
    }
  }

  --rescript-lang
  use 'rescript-lang/vim-rescript'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'cmp_setup'
    end,
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'andersevenrud/cmp-tmux', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-copilot', after = 'nvim-cmp' },
      { 'dmitmel/cmp-cmdline-history', after = 'nvim-cmp' },
      { 'ray-x/cmp-treesitter', after = 'nvim-cmp' },
      { 'tzachar/cmp-fuzzy-path', after = 'nvim-cmp',
        requires = { 'tzachar/fuzzy.nvim' },
      }

    }
  }
  use { 'L3MON4D3/LuaSnip', config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end, requires = { 'rafamadriz/friendly-snippets' }
  }

  use 'wellle/targets.vim'
  use 'tpope/vim-tbone'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sensible'
  use 'tpope/vim-obsession'
  use 'tpope/vim-rsi'
  use 'tpope/vim-scriptease'
  use { 'github/copilot.vim', config = function()
    vim.cmd [[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
    vim.g.copilot_no_tab_map = true
  end }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt" },
      })
    end
  }

  use { 'antoinemadec/FixCursorHold.nvim', config = function()
    vim.g.cursorhold_updatetime = 100
  end }

  use { 'mg979/vim-visual-multi', branch = 'master' }
  use { 'numToStr/Comment.nvim', config =
  function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      ignore = nil,
      mappings = {
        basic = true,
        extra = true,
        extended = false,
      },
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      pre_hook = nil,
      post_hook = nil,
    })

    require 'Comment.ft'.set('dart', { '// %s', '/*%s*/' })

  end }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine_setup')
    end,
    requires = {
      { 'arkav/lualine-lsp-progress', after = 'lualine.nvim' },
    }
  }

  use { 'norcalli/nvim-colorizer.lua', config = function()
    require 'colorizer'.setup()
  end }
  use 'mtdl9/vim-log-highlighting'
  use 'jremmen/vim-ripgrep'

  -- csv
  use 'chrisbra/csv.vim'
end)
