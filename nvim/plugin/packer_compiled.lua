-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/hlg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/hlg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/hlg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/hlg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/hlg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18comment_setup\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["awesome-flutter-snippets"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/awesome-flutter-snippets",
    url = "https://github.com/Neevash/awesome-flutter-snippets"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history/after/plugin/cmp_cmdline_history.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-copilot"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-copilot/after/plugin/cmp_copilot.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-copilot",
    url = "https://github.com/hrsh7th/cmp-copilot"
  },
  ["cmp-fuzzy-path"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-fuzzy-path/after/plugin/cmp_fuzzy_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-fuzzy-path",
    url = "https://github.com/tzachar/cmp-fuzzy-path"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after/plugin/cmp_tmux.vim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  ["cmp-treesitter"] = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after_files = { "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\t\0\0186\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0+\1\2\0=\1\4\0006\0\0\0009\0\3\0005\1\a\0006\2\0\0009\2\3\0029\2\6\2\19\2\2\0=\2\b\1=\1\5\0K\0\1\0\bcpp\1\0\0\fcp_flag\22copilot_filetypes\23copilot_no_tab_map\6g>imap <silent><script><expr> <C-J> copilot#Accept(\"\\<CR>\")\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/dart-vim-plugin",
    url = "https://github.com/dart-lang/dart-vim-plugin"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fflutter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/flutter-tools.nvim",
    url = "https://github.com/huylg/flutter-tools.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19gitsigns_setup\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine-lsp-progress"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    after = { "lualine-lsp-progress" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18lualine_setup\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18neotest_setup\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/huylg/neotest"
  },
  ["neotest-dart"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/neotest-dart",
    url = "https://github.com/huylg/neotest-dart"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-tmux", "cmp-treesitter", "cmp_luasnip", "cmp-buffer", "cmp-cmdline", "cmp-cmdline-history", "cmp-copilot", "cmp-fuzzy-path", "cmp-path" },
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14cmp_setup\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20lspconfig_setup\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-refactor", "nvim-treesitter-textobjects", "playground" },
    config = { "\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ats\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pubspec-assist.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19pubspec-assist\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/pubspec-assist.nvim",
    url = "https://github.com/akinsho/pubspec-assist.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26symbols-outline_setup\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-native.nvim", "telescope-ui-select.nvim" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20telescope_setup\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-diagnostic.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23textobj-diagnostic\frequire\0" },
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/textobj-diagnostic.nvim",
    url = "https://github.com/andrewferrier/textobj-diagnostic.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-log-highlighting"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-log-highlighting",
    url = "https://github.com/mtdl9/vim-log-highlighting"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "https://github.com/bluz71/vim-nightfly-guicolors"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-scriptease",
    url = "https://github.com/tpope/vim-scriptease"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people",
    url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tbone"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-tbone",
    url = "https://github.com/tpope/vim-tbone"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/hlg/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14cmp_setup\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19gitsigns_setup\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18lualine_setup\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20telescope_setup\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: pubspec-assist.nvim
time([[Config for pubspec-assist.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19pubspec-assist\frequire\0", "config", "pubspec-assist.nvim")
time([[Config for pubspec-assist.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18comment_setup\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26symbols-outline_setup\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0", "config", "FixCursorHold.nvim")
time([[Config for FixCursorHold.nvim]], false)
-- Config for: textobj-diagnostic.nvim
time([[Config for textobj-diagnostic.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23textobj-diagnostic\frequire\0", "config", "textobj-diagnostic.nvim")
time([[Config for textobj-diagnostic.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18neotest_setup\frequire\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20lspconfig_setup\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ats\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\t\0\0186\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0+\1\2\0=\1\4\0006\0\0\0009\0\3\0005\1\a\0006\2\0\0009\2\3\0029\2\6\2\19\2\2\0=\2\b\1=\1\5\0K\0\1\0\bcpp\1\0\0\fcp_flag\22copilot_filetypes\23copilot_no_tab_map\6g>imap <silent><script><expr> <C-J> copilot#Accept(\"\\<CR>\")\bcmd\bvim\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-fuzzy-path ]]
vim.cmd [[ packadd cmp-treesitter ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-copilot ]]
vim.cmd [[ packadd cmp-tmux ]]
vim.cmd [[ packadd cmp-cmdline-history ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

vim.cmd [[ packadd telescope-ui-select.nvim ]]

-- Config for: telescope-ui-select.nvim
try_loadstring("\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0", "config", "telescope-ui-select.nvim")

vim.cmd [[ packadd lualine-lsp-progress ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType feature ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "feature" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
