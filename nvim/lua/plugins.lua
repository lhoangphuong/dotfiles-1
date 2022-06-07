local packer_notify = function (msg,level)
    vim.notify(msg, level, { title = 'Packer' })
end local fn = vim.fn
local fmt = string.format

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
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


vim.keymap.set('n','<leader>ps',"<cmd>PackerSync<cr>",{ noremap=true,
  silent=true })
vim.keymap.set('n','<leader>pc',"<cmd>PackerClean<cr>",{ noremap=true,
  silent=true })

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
  { command = [[ source <afile> | PackerCompile ]],
  group = packer_group, pattern = '**/*.lua' })

local packer = require('packer')
packer.init({
  git = {
        clone_timeout = 600, -- Timeout, in seconds, for git clones
  }
})
return packer.startup(function(use)


use 'wbthomason/packer.nvim'

-- color Theme
use {'Mofiqul/vscode.nvim', branch = 'main'}
use 'gruvbox-community/gruvbox'
use({
    "catppuccin/nvim",
    as = "catppuccin"
})

-- Tree sitter
use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function ()
      require'ts'
    end,
    requires = {
      {'nvim-treesitter/playground',after = 'nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-textobjects',after = 'nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-refactor',after = 'nvim-treesitter'},
      {'nkrkv/nvim-treesitter-rescript',run = ':TSInstall rescript', after = 'nvim-treesitter'}
    },
}

-- telescope
use {
  'nvim-telescope/telescope.nvim',
    config = function ()
      require'telescope_setup'
    end,
  requires = {
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-ui-select.nvim', after = 'telescope.nvim',
        config = function ()
          require'telescope'.load_extension('ui-select')
        end
    },
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after =
        'telescope.nvim' ,config = function ()
	require('telescope').load_extension('fzf')
    end
    }
  },
}

-- git stuff
use 'tpope/vim-fugitive'
use {'tommcdo/vim-fubitive',config = function ()
   vim.g.fubitive_domain_pattern = 'bitbucket.svc.elca.ch'
end}
use {
  'lewis6991/gitsigns.nvim',
  requires =  'nvim-lua/plenary.nvim',
  config = function ()
      require'gitsigns_setup'
  end
}

-- ThePrimeagen
-- use 'ThePrimeagen/git-worktree.nvim'

-- lsp stuff
use{'neovim/nvim-lspconfig', config = function ()
    require'lspstuff'
end}

use{'j-hui/fidget.nvim', config = function ()
  require"fidget".setup{
    text = {
      spinner = "pipe",
      done = "(っ- ‸ - ς) ",
      commenced = "Started",
      completed = "Completed",
    }, window = {
      blend = 0
    }
  }
  end
}

--flutter
use {
  'akinsho/flutter-tools.nvim', requires = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'dart-lang/dart-vim-plugin',
      'Neevash/awesome-flutter-snippets',
    },
    config = function ()
       require'flutter'
    end
}

-- debug stuff
use {'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      after = 'nvim-dap', config = function ()
          require'dap_setup'
      end
    }
  }

--rescript-lang
use 'rescript-lang/vim-rescript'

-- autocomplete
use{
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp_setup'
    end,
    requires = {
      {'hrsh7th/cmp-nvim-lsp',after='nvim-cmp'},
      {'hrsh7th/cmp-buffer',after='nvim-cmp'},
      {'hrsh7th/cmp-path',after='nvim-cmp'},
      {'hrsh7th/cmp-cmdline',after='nvim-cmp'},
      {'saadparwaiz1/cmp_luasnip',after='nvim-cmp'},
      {'andersevenrud/cmp-tmux', after='nvim-cmp'},
      {'hrsh7th/cmp-copilot',after='nvim-cmp'},
      {'dmitmel/cmp-cmdline-history',after='nvim-cmp',
      {'ray-x/cmp-treesitter', after='nvim-cmp'}
      }
  }
}

use{ 'L3MON4D3/LuaSnip',config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()
end, requires = {'rafamadriz/friendly-snippets'}
}

use 'wellle/targets.vim'
use 'tpope/vim-surround'
use 'tpope/vim-unimpaired'
use 'tpope/vim-eunuch'
use 'tpope/vim-sleuth'
use 'tpope/vim-vinegar'
use 'tpope/vim-dispatch'
use 'tpope/vim-repeat'
use 'tpope/vim-sensible'
use 'tpope/vim-rsi'
use {'github/copilot.vim',config = function ()
    vim.cmd[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
    vim.g.copilot_no_tab_map = true
end}

-- other plugins
use {'windwp/nvim-autopairs',config = function ()
  require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt"},
  })
end}

use {'antoinemadec/FixCursorHold.nvim',config = function ()
 vim.g.cursorhold_updatetime = 100
end}

use {'mg979/vim-visual-multi', branch = 'master'}
use {'numToStr/Comment.nvim', config =
    function ()
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

    require'Comment.ft'.set('dart', {'// %s', '/*%s*/'})

end}

use {
  'nvim-lualine/lualine.nvim',
  config = function ()
      require ('lualine_setup')
  end,
  requires = { 'kyazdani42/nvim-web-devicons', opt = true, config =function ()
    require'nvim-web-devicons'.setup {
      override = {
       zsh = {
       icon = "",
       color = "#428850",
       name = "Zsh"
       }
      };
      default = true;
    }
    end
  }
}

use {'norcalli/nvim-colorizer.lua',config = function ()
    require'colorizer'.setup()
end}

use {'simrat39/rust-tools.nvim',
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
    config = function ()
        require'rust-tools_setup'
    end,
}

use {
  'tami5/xbase',
    run = 'make install',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      local config = {
        --- Log level. Set to error to ignore everything: { "trace", "debug", "info", "warn", "error" }
        log_level = "debug",
        --- Default log buffer direction: { "horizontal", "vertical", "float" }
        default_log_buffer_direction = "horizontal",
        --- Statusline provider configurations
        statusline = {
          running = { icon = "⚙", color = "#e0af68" },
          device_running = { icon = "", color = "#4a6edb" },
          success = { icon = "", color = "#1abc9c" },
          failure = { icon = "", color = "#db4b4b" },
          show_progress = false,
        },
        --- TODO(nvim): Limit devices platform to select from
        simctl = {
          iOS = {
            "iPhone 13 Pro",
            "iPad (9th generation)",
          },
        },
        mappings = {
          --- Whether xbase mapping should be disabled.
          enable = true,
          --- Open build picker. showing targets and configuration.
          build_picker = "<leader>b", --- set to 0 to disable
          --- Open run picker. showing targets, devices and configuration
          run_picker = "<leader>r", --- set to 0 to disable
          --- Open watch picker. showing run or build, targets, devices and configuration
          watch_picker = "<leader>s", --- set to 0 to disable
          --- A list of all the previous pickers
          all_picker = "<leader>ef", --- set to 0 to disable
          --- horizontal toggle log buffer
          toggle_split_log_buffer = "<leader>ls",
          --- vertical toggle log buffer
          toggle_vsplit_log_buffer = "<leader>lv",
        }
  }
  require('xbase').setup(config)
  end
}

end)
