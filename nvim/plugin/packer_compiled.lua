-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/TVG/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/TVG/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/TVG/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/TVG/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/TVG/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\14\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\v\0'\2\f\0005\3\r\0B\0\3\1K\0\1\0\1\3\0\0\n// %s\v/*%s*/\tdart\bset\15Comment.ft\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\rmappings\1\0\3\rextended\1\nextra\2\nbasic\2\1\0\2\vsticky\2\fpadding\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["awesome-flutter-snippets"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/awesome-flutter-snippets",
    url = "https://github.com/Neevash/awesome-flutter-snippets"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-copilot"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-copilot/after/plugin/cmp_copilot.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-copilot",
    url = "https://github.com/hrsh7th/cmp-copilot"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after/plugin/cmp_tmux.vim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  ["cmp-treesitter"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0+\1\2\0=\1\4\0K\0\1\0\23copilot_no_tab_map\6g>imap <silent><script><expr> <C-J> copilot#Accept(\"\\<CR>\")\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["cpeditor.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\6\0\25\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\0035\4\n\0005\5\v\0=\5\f\4=\4\r\3=\3\14\0025\3\22\0005\4\16\0005\5\15\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\4=\4\23\3=\3\24\2B\0\2\1K\0\1\0\nlangs\bcpp\1\0\0\bgen\1\4\0\0\fgen.cpp\25g++ -Wall -O2 -o gen\n./gen\nbrute\1\4\0\0\14brute.cpp\27g++ -Wall -O2 -o brute\f./brute\tmain\1\0\0\1\4\0\0\fsol.cpp\25g++ -Wall -O2 -o sol\n./sol\flayouts\fdefault\norder\1\6\0\0\3\1\3\2\3\3\3\4\3\5\1\0\1\bcmdOset nosplitright | vs | setl wfw | wincmd w | bel sp | vs | vs | 1wincmd w\rfloating\1\0\0\nlinks\1\0\0037https://codeforces.com/contest/(%d+)/problem/(%w+)\30~/code/contest/codeforces:https://codeforces.com/problemset/problem/(%d+)/(%w+)\30~/code/contest/codeforces\nlocal\17~/code/local\16integration\1\0\2\19default_layout\fdefault\17default_lang\bcpp\1\0\2\15bufferline\1\rnvim_dap\1\nsetup\rcpeditor\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/cpeditor.nvim",
    url = "https://github.com/nullchilly/cpeditor.nvim"
  },
  ["crates.nvim"] = {
    after_files = { "/Users/TVG/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/dart-vim-plugin",
    url = "https://github.com/dart-lang/dart-vim-plugin"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fflutter\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/huylg/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-worktree.nvim"] = {
    config = { "\27LJ\2\nx\0\0\3\0\6\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0B\0\2\1K\0\1\0\17git_worktree\19load_extension\14telescope\nsetup\17git-worktree\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19gitsigns_setup\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/gruvbox-community/gruvbox"
  },
  ["lualine-lsp-progress"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    after = { "lualine-lsp-progress" },
    loaded = true,
    only_config = true
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-path", "cmp-cmdline", "cmp-copilot", "cmp-tmux", "cmp-treesitter", "cmp_luasnip" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rlspstuff\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "playground", "nvim-treesitter-rescript", "nvim-treesitter-textobjects", "nvim-treesitter-refactor" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-rescript"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-rescript",
    url = "https://github.com/nkrkv/nvim-treesitter-rescript"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21rust-tools_setup\frequire\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-native.nvim", "telescope-ui-select.nvim" },
    loaded = true,
    only_config = true
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fubitive"] = {
    config = { "\27LJ\2\nO\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\26bitbucket.svc.elca.ch\28fubitive_domain_pattern\6g\bvim\0" },
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-fubitive",
    url = "https://github.com/tommcdo/vim-fubitive"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-log-highlighting"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-log-highlighting",
    url = "https://github.com/mtdl9/vim-log-highlighting"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rescript"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-rescript",
    url = "https://github.com/rescript-lang/vim-rescript"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["yaml.nvim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/TVG/.local/share/nvim/site/pack/packer/opt/yaml.nvim",
    url = "https://github.com/cuducos/yaml.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: flutter-tools.nvim
time([[Config for flutter-tools.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fflutter\frequire\0", "config", "flutter-tools.nvim")
time([[Config for flutter-tools.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rlspstuff\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14cmp_setup\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: git-worktree.nvim
time([[Config for git-worktree.nvim]], true)
try_loadstring("\27LJ\2\nx\0\0\3\0\6\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0B\0\2\1K\0\1\0\17git_worktree\19load_extension\14telescope\nsetup\17git-worktree\frequire\0", "config", "git-worktree.nvim")
time([[Config for git-worktree.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19gitsigns_setup\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0+\1\2\0=\1\4\0K\0\1\0\23copilot_no_tab_map\6g>imap <silent><script><expr> <C-J> copilot#Accept(\"\\<CR>\")\bcmd\bvim\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: vim-fubitive
time([[Config for vim-fubitive]], true)
try_loadstring("\27LJ\2\nO\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\26bitbucket.svc.elca.ch\28fubitive_domain_pattern\6g\bvim\0", "config", "vim-fubitive")
time([[Config for vim-fubitive]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ats\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18lualine_setup\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\14\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\v\0'\2\f\0005\3\r\0B\0\3\1K\0\1\0\1\3\0\0\n// %s\v/*%s*/\tdart\bset\15Comment.ft\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\rmappings\1\0\3\rextended\1\nextra\2\nbasic\2\1\0\2\vsticky\2\fpadding\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21rust-tools_setup\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20telescope_setup\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0", "config", "FixCursorHold.nvim")
time([[Config for FixCursorHold.nvim]], false)
-- Config for: cpeditor.nvim
time([[Config for cpeditor.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\6\0\25\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0004\4\0\0=\4\t\0035\4\n\0005\5\v\0=\5\f\4=\4\r\3=\3\14\0025\3\22\0005\4\16\0005\5\15\0=\5\17\0045\5\18\0=\5\19\0045\5\20\0=\5\21\4=\4\23\3=\3\24\2B\0\2\1K\0\1\0\nlangs\bcpp\1\0\0\bgen\1\4\0\0\fgen.cpp\25g++ -Wall -O2 -o gen\n./gen\nbrute\1\4\0\0\14brute.cpp\27g++ -Wall -O2 -o brute\f./brute\tmain\1\0\0\1\4\0\0\fsol.cpp\25g++ -Wall -O2 -o sol\n./sol\flayouts\fdefault\norder\1\6\0\0\3\1\3\2\3\3\3\4\3\5\1\0\1\bcmdOset nosplitright | vs | setl wfw | wincmd w | bel sp | vs | vs | 1wincmd w\rfloating\1\0\0\nlinks\1\0\0037https://codeforces.com/contest/(%d+)/problem/(%w+)\30~/code/contest/codeforces:https://codeforces.com/problemset/problem/(%d+)/(%w+)\30~/code/contest/codeforces\nlocal\17~/code/local\16integration\1\0\2\19default_layout\fdefault\17default_lang\bcpp\1\0\2\15bufferline\1\rnvim_dap\1\nsetup\rcpeditor\frequire\0", "config", "cpeditor.nvim")
time([[Config for cpeditor.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd nvim-treesitter-rescript ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd telescope-ui-select.nvim ]]

-- Config for: telescope-ui-select.nvim
try_loadstring("\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0", "config", "telescope-ui-select.nvim")

vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-copilot ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-treesitter ]]
vim.cmd [[ packadd cmp-tmux ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd lualine-lsp-progress ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'yaml.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
