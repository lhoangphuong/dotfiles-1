local neotest = require 'neotest'
neotest.setup({
  adapters = {
    require('neotest-dart') {
      command = 'fvm flutter', -- Command being used to run tests. Defaults to `flutter`
    },
  },
  consumers = {},
  default_strategy = "integrated",
  diagnostic = {
    enabled = true
  },
  discovery = {
    enabled = true
  },
  floating = {
    border = "rounded",
    max_height = 0.8,
    max_width = 0.8,
    options = {}
  },
  highlights = {
    adapter_name = "NeotestAdapterName",
    border = "NeotestBorder",
    dir = "NeotestDir",
    expand_marker = "NeotestExpandMarker",
    failed = "NeotestFailed",
    file = "NeotestFile",
    focused = "NeotestFocused",
    indent = "NeotestIndent",
    marked = "NeotestMarked",
    namespace = "NeotestNamespace",
    passed = "NeotestPassed",
    running = "NeotestRunning",
    select_win = "NeotestWinSelect",
    skipped = "NeotestSkipped",
    target = "NeotestTarget",
    test = "NeotestTest",
    unknown = "NeotestUnknown"
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "✖",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "✔",
    running = "ϟ",
    skipped = "ﰸ",
    unknown = "?"
  },
  jump = {
    enabled = true
  },
  output = {
    enabled = true,
    open_on_run = "full"
  },
  run = {
    enabled = true
  },
  status = {
    enabled = true,
    signs = false,
    virtual_text = true,
  },
  strategies = {
    integrated = {
      height = 400,
      width = 400
    }
  },
  summary = {
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = "a",
      clear_marked = "M",
      clear_target = "T",
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      jumpto = "i",
      mark = "m",
      output = "o",
      run = "r",
      run_marked = "R",
      short = "O",
      stop = "u",
      target = "t"
    }
  }
})


vim.api.nvim_create_user_command('TestSummary', neotest.summary.toggle, {})
vim.api.nvim_create_user_command('TestNearest', neotest.run.run, {})
vim.api.nvim_create_user_command('TestDap', function()
  neotest.run.run({ strategy = 'dap' })
end, {})
vim.api.nvim_create_user_command('TestLast', neotest.run.run_last, {})
vim.api.nvim_create_user_command('TestLastDap', function()
  neotest.run.run_last({ strategy = 'dap' })
end, {})
vim.api.nvim_create_user_command('TestStop', function()
  neotest.run.stop({})
end, {})
vim.api.nvim_create_user_command('TestFile', function()
  neotest.run.run(vim.fn.expand('%'))
end, {})
vim.api.nvim_create_user_command('TestOutput', function()
  neotest.output.open({ short = false, enter = true })
end, {})
vim.api.nvim_create_user_command('TestDap', function()
  neotest.run.run({ strategy = 'dap' })
end, {})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>ts', neotest.summary.toggle, opts)
vim.keymap.set('n', '<space>tl', neotest.run.run_last, opts)
vim.keymap.set('n', '<space>tr', neotest.run.run, opts)
vim.keymap.set('n', '<space>to', function()
  neotest.output.open({ short = false, enter = true })
end, opts)


vim.keymap.set('n', ']n', function()
  neotest.jump.next { status = 'failed' }
end, opts)
vim.keymap.set('n', '[n', function()
  neotest.jump.prev { status = 'failed' }
end, opts)


vim.keymap.set('n', ']t', neotest.jump.next, opts)
vim.keymap.set('n', '[t', neotest.jump.prev, opts)

local neotest_group = vim.api.nvim_create_augroup('neotest', {})

local autocmd_id
vim.api.nvim_create_user_command('TestWatch', function()
  autocmd_id = vim.api.nvim_create_autocmd('BufWritePost',
    { command = 'TestLast',
      group = neotest_group, pattern = '**/*.dart' })
end, {})


vim.api.nvim_create_user_command('TestWatchStop', function()
  vim.api.nvim_del_autocmd(autocmd_id)
end, {})
