local packer_notify = function (msg,level)
    vim.notify(msg, level, { title = 'Packer' })
end
local fn = vim.fn
local fmt = string.format

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_notify 'Downloading packer.nvim...'
  packer_notify(
    fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
  )
  vim.cmd 'packadd! packer.nvim'
  require('packer').sync()
else
  vim.cmd(fmt('packadd! %s', 'packer.nvim'))
end


vim.api.nvim_set_keymap('n','<leader>ps',"<cmd>PackerSync<cr>",{ noremap=true, silent=true })
vim.api.nvim_set_keymap('n','<leader>pc',"<cmd>PackerClean<cr>",{ noremap=true, silent=true })

local packer = require('packer')
packer.init({
  git = {
        clone_timeout = 600, -- Timeout, in seconds, for git clones
  }
})
return packer.startup(function()


use 'wbthomason/packer.nvim'

-- color Theme
use {'Mofiqul/vscode.nvim', branch = 'main',config = function ()
    require'vscode_setup'
end }

-- Tree sitter
use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function ()
      require'ts'
    end,
    requires = {
      {'nvim-treesitter/playground',after = 'nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
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
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim' ,config = function ()
	require('telescope').load_extension('fzf')
    end
    }
  },
}

-- git stuff
use 'tpope/vim-fugitive'
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
use{ 'neovim/nvim-lspconfig', config = function ()
    require'lspstuff'
end}
use{ 'j-hui/fidget.nvim', config = function ()
  require"fidget".setup{
    text = {
      spinner = "pipe",
      done = "ლ( ͡❛ ‿‿ ͡❛)ლ",
      commenced = "Started",
      completed = "Completed",
    },
    window = {
      blend = 0
    }
  }
  end
}

--flutter
use 'Neevash/awesome-flutter-snippets'
use {
  'huylg/flutter-tools.nvim', requires ={
    'nvim-lua/plenary.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
    config = function ()
      require'flutter'
    end
}

use {'sidlatau/lsp-fastaction.nvim',config = function ()
  require('lsp-fastaction').setup({})
end}

-- debug stuff
use {'mfussenegger/nvim-dap',requires ={ 'rcarriga/nvim-dap-ui', after = 'nvim-dap', config = function ()
    require'dap_setup'
end}}

--rust
-- use 'simrat39/rust-tools.nvim'
--rescript-lang
use 'rescript-lang/vim-rescript'
use{ 'nkrkv/nvim-treesitter-rescript',run = ':TSInstall rescript' }

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
      {'hrsh7th/cmp-cmdline'} ,
      {'hrsh7th/cmp-vsnip',after='nvim-cmp',config = function ()
        vim.cmd([[
          " Expand
          imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
          smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

          " Expand or jump
          imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
          smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

          " Jump forward or backward
          imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
          smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
          imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
          smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
        ]])
      end},
      {'hrsh7th/vim-vsnip',after='nvim-cmp'},
      {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp',after='nvim-cmp'},
  }


}

-- tpope
-- use 'github/copilot.vim'
use 'tpope/vim-surround'
use 'tpope/vim-unimpaired'
use 'huylg/vim-sensible'
use 'tpope/vim-eunuch'
use 'tpope/vim-sleuth'
use 'tpope/vim-vinegar'


-- other plugins
use {'windwp/nvim-autopairs',config = function ()
  require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt"},
  })
end}
use {'mg979/vim-visual-multi', branch = 'master'}
use {'numToStr/Comment.nvim', config = function ()
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
use {'norcalli/nvim-colorizer.lua',config = function() require'colorizer'.setup() end}
end)
