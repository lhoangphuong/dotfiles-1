local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')

local previewers = require('telescope.previewers')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath) vim.loop.fs_stat(filepath, function(_,
    stat)
  if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup{
  igfile_ignore_patterns = { "node_modules" },
  defaults = {
    buffer_previewer_maker = new_maker,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-l>"] = actions.send_to_loclist,
        ['?'] = actions_layout.toggle_preview,
      },
      n = {
        ["<C-w>"] = actions.send_selected_to_qflist,
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-l>"] = actions.send_to_loclist,
      },
    },
  },
   extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

local ivy = require('telescope.themes').get_ivy();
local builtin = require'telescope.builtin'

local opts = { noremap=true, silent=true }

vim.keymap.set('n','<space>p',function ()
  if vim.loop.cwd() == vim.fn.getenv('HOME')..'/dotfiles' then
     builtin.git_files({previewer = false})
  else
     builtin.find_files({previewer = false})
  end
end,opts)

vim.keymap.set('n','<space>fg',builtin.live_grep,opts)
vim.keymap.set('n','<space>fb',builtin.buffers,opts)
vim.keymap.set('n','<space>fo',builtin.oldfiles,opts)
vim.keymap.set('n','<space>fr',builtin.resume,opts)

vim.keymap.set('n','<space>qf',function ()
  builtin.quickfix(ivy)
end,opts)

vim.keymap.set('n','<space>gr',function ()
  builtin.lsp_references(ivy)
end ,opts)

vim.keymap.set('n','<space>gd',function ()
  builtin.lsp_definitions(ivy)
end ,opts)

vim.keymap.set('n','<space>fd',function ()
  builtin.diagnostics(ivy)
end ,opts)

vim.keymap.set('n','<space>t',function ()
  vim.cmd 'Telescope'
end,opts)
