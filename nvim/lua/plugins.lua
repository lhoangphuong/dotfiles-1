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


  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    -- commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
    config = function()
      require 'ts'
    end,
    requires = {
      { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
      { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
      { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
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

  --rust
  use { 'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      use {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
          require('crates').setup()
        end,
      }

    },
    config = function()
      require 'rusttools_setup'
    end,
  }

  --flutter
  use {
    'huylg/flutter-tools.nvim', requires = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'dart-lang/dart-vim-plugin',
      'Neevash/awesome-flutter-snippets',
      'RobertBrunhage/flutter-riverpod-snippets'
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

  --clangd
  use { 'p00f/clangd_extensions.nvim', config = function()
    require 'clangd_setup'
  end }


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
    vim.g.copilot_filetypes = {
      cpp = not vim.g.cp_flag,
    }
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
    require 'comment_setup'
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

  -- csv
  use 'chrisbra/csv.vim'

  -- http client
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require 'rest_setup'
    end
  }
end)
