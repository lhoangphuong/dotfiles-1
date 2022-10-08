local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')

local previewers = require('telescope.previewers')
local git_root = require('lspconfig').util.find_git_ancestor(vim.fn.getcwd())

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_,
                                      stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup {
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
    ['ui-select'] = {
      require('telescope.themes').get_ivy();
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  }
}

local ivy = require('telescope.themes').get_ivy();
local dropdown = require('telescope.themes').get_dropdown({ previewer = false });
local builtin = require 'telescope.builtin'

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<space>p', function()
  builtin.git_files({ previewer = false, cwd = git_root })
end, opts)

vim.keymap.set('n', '<space><space>', function()
  builtin.find_files({ previewer = false })
end, opts)

vim.api.nvim_create_user_command('Config', function()
  builtin.git_files({
    previewer = false,
    cwd = vim.fs.normalize('$DOTFILE_DIR')
  })
end, {})
vim.keymap.set('n', '<space>P', function()
  builtin.find_files({
    previewer = false,
    cwd = require('packer').config.package_root,
  })
end, opts)

vim.api.nvim_create_user_command('Admintool', function()
  builtin.git_files({
    previewer = false,
    cwd = vim.fs.normalize('$HOME/elca-workspace/tixngo-admintool-flutter-2')
  })
end, {})
vim.api.nvim_create_user_command('Sdk', function()
  builtin.git_files({
    previewer = false,
    cwd = vim.fs.normalize('$HOME/elca-workspace/tyxr-app-sdk')
  })
end, {})

vim.api.nvim_create_user_command('TelescopeFindDirectory', function()
  local find_command = { 'fd', '--type', 'd' }
  builtin.find_files({
    find_command = find_command,
    previewer = false,
    cwd = git_root,
    attach_mappings = function(bufnr)
      actions.select_default:replace(function()
        local action_state = require "telescope.actions.state"
        local selection = action_state.get_selected_entry()
        if selection ~= nil then
          actions.close(bufnr)
          local open_command = string.format('tab drop %s/%s/', git_root, selection.value)
          local cwd_command = string.format('tcd %s/%s/', git_root, selection.value)
          vim.cmd(open_command)
          vim.cmd(cwd_command)
        end
      end)

      return true
    end })
end, {})


vim.keymap.set('n', '<space>qf', function()
  builtin.quickfix(ivy)
end, opts)

vim.keymap.set('n', '<space>st', function()
  vim.cmd 'Telescope'
end, opts)

vim.keymap.set('n', '<space>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<space>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<space>fb', require('telescope.builtin').buffers, { desc = '[f]ind existing [B]uffers' })
vim.keymap.set('n', '<space>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(dropdown)
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<space>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<space>sw', function()
  require('telescope.builtin').grep_string({ search_dirs = { git_root } })
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<space>sg', function()
  require('telescope.builtin').live_grep({
    cwd = git_root,
  })
end, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<space>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
