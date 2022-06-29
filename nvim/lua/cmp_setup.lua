-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require("luasnip")

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
        treesitter = "[TS]",
        copilot = "[Copilot]",
        tmux = "[tmux]",
        cmdline = "[CMD]",
        cmdline_history = "[History]",
        fuzzy_path = "[FuzzyPath]"
      })[entry.source.name]
      return vim_item
    end
  },
  snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end,
    },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
  mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  confirmation = { completeopt = 'menu,menuone,noinsert' },
  sources = cmp.config.sources({
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'treesitter' },
      { name = 'fuzzy_path' },
      { name = 'copilot'},
      { name = 'tmux',
        option = {
          all_panes = false,
          trigger_characters = { '.' },
          trigger_characters_ft = {} -- { filetype = { '.' } }
        }
      },
     { name = 'buffer' },
    }
    ),{
    }
})
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'fuzzy_path',
      options = {
        fd_cmd = { 'fd', '-d', '20', '-p', '-i' },
        allowed_cmd_context = {
          [string.byte('e')] = true,
          [string.byte('w')] = true,
          [string.byte('r')] = true,
        },
        fd_timeout_msec = 500,
      }
    },
    { name = 'path' },
  }, {
    { name = 'cmdline' },
    { name = 'cmdline_history' },
  })
})
