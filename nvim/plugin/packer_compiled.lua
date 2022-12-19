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
local package_path_str = "/Users/subramaniraju/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/subramaniraju/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/subramaniraju/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/subramaniraju/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/subramaniraju/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n`\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22execution_message\1\0\0\1\0\1\fmessage\5\nsetup\14auto-save\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cutlass.nvim"] = {
    config = { "\27LJ\2\nV\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fexclude\1\0\0\1\3\0\0\and\axd\nsetup\fcutlass\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/cutlass.nvim",
    url = "https://github.com/gbprod/cutlass.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n/\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\22goimports | gofmt\nstdin\2‚\1\1\0\b\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5>\5\1\4=\4\6\0034\4\3\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5>\5\1\4=\4\t\0034\4\3\0003\5\n\0>\5\1\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\rfiletype\1\0\0\ago\0\tjson\ajq\29formatter.filetypes.json\blua\1\0\0\vstylua\28formatter.filetypes.lua\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ago\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["gruvbox-material"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!colorscheme gruvbox-material\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\28show_first_indent_level\1#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¢\2\0\0\6\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0035\4\n\0005\5\t\0>\5\1\4=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\rsections\14lualine_x\1\2\0\0\rfiletype\14lualine_b\1\3\0\0\0\16diagnostics\1\2\1\0\vbranch\ticon\bÔêò\14lualine_c\1\0\0\1\2\2\0\rfilename\tpath\3\1\16file_status\1\foptions\1\0\0\1\0\2\18icons_enabled\2\ntheme\21gruvbox-material\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nœ\2\0\0\4\0\20\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0014\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0005\1\n\0005\2\v\0>\2\2\1=\1\t\0005\1\r\0005\2\14\0>\2\2\1=\1\f\0005\1\16\0005\2\17\0>\2\2\1=\1\15\0006\1\0\0'\3\18\0B\1\2\0029\1\19\1\18\3\0\0B\1\2\1K\0\1\0\17set_mappings\21neoscroll.config\1\2\0\0\a50\1\2\0\0\azb\azb\1\2\0\0\a50\1\2\0\0\azz\azz\1\2\0\0\a50\1\2\0\0\azt\azt\1\4\0\0\18vim.wo.scroll\ttrue\a50\1\2\0\0\vscroll\n<C-d>\1\4\0\0\19-vim.wo.scroll\ttrue\a50\1\2\0\0\vscroll\n<C-u>\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1¿\tbody\15lsp_expand_\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\fluasnip\b‚ãó\vbuffer\aŒ©\rnvim_lsp\aŒª\tpath\tüñ´ı\1\0\1\a\2\v\2)6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\5Ä-\2\0\0009\2\5\2-\4\1\0B\2\2\1X\2\24Ä\b\1\1\0X\2\16Ä6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3Ä\18\2\0\0B\2\1\1X\2\3Ä-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0¿\2¿\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0X\0\1\4\2\2\0\r-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1-\3\1\0B\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\21select_prev_item\fvisibleï\6\1\0\v\0003\0Z6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0009\3\3\0009\3\4\3=\3\6\0029\3\a\0005\5\v\0005\6\t\0003\a\b\0=\a\n\6=\6\f\0059\6\r\0009\6\14\0064\b\5\0005\t\15\0>\t\1\b5\t\16\0>\t\2\b5\t\17\0>\t\3\b5\t\18\0>\t\4\bB\6\2\2=\6\14\0055\6\21\0009\a\r\0009\a\19\a9\a\20\aB\a\1\2=\a\22\6=\6\19\0055\6\24\0005\a\23\0=\a\25\0063\a\26\0=\a\27\6=\6\28\0055\6\31\0009\a\29\0009\a\30\a\18\t\2\0B\a\2\2=\a \0069\a\29\0009\a!\a\18\t\2\0B\a\2\2=\a\"\0069\a\29\0009\a#\a5\t$\0B\a\2\2=\a%\0069\a\29\0003\t&\0005\n'\0B\a\3\2=\a(\0069\a\29\0003\t)\0005\n*\0B\a\3\2=\a+\6=\6\29\5B\3\2\0019\3\a\0009\3,\3'\5-\0005\6/\0009\a\29\0009\a.\a9\a,\aB\a\1\2=\a\29\0064\a\4\0005\b0\0>\b\1\a5\b1\0>\b\2\a5\b2\0>\b\3\a=\a\14\6B\3\3\0012\0\0ÄK\0\1\0\1\0\1\tname\20cmdline_history\1\0\1\tname\tpath\1\0\1\tname\fcmdline\1\0\0\vpreset\6:\fcmdline\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\v<Down>\21select_next_item\t<Up>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\18documentation\1\0\0\rbordered\vwindow\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\rbehavior\1\0\0\vSelect\19SelectBehavior\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nı\3\0\0\b\0\28\00086\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\2\0039\3\5\0035\4\6\0B\1\3\2=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\2\0039\3\b\0035\4\t\0B\1\3\2=\1\a\0006\0\n\0'\2\v\0B\0\2\0029\0\f\0B\0\1\0026\1\n\0'\3\r\0B\1\2\0029\1\14\0019\1\15\0015\3\23\0005\4\21\0005\5\19\0005\6\17\0005\a\16\0=\a\18\6=\6\20\5=\5\22\4=\4\24\3=\0\25\3B\1\2\0016\1\n\0'\3\r\0B\1\2\0029\1\26\0019\1\15\0015\3\27\0=\0\25\3B\1\2\1K\0\1\0\1\0\0\ngopls\17capabilities\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nsetup\16sumneko_lua\14lspconfig\25default_capabilities\17cmp_nvim_lsp\frequire\1\0\1\vborder\frounded\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¶\1\0\0\4\0\b\1\0236\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\0\0\0\t\0\0\0X\0\15Ä6\0\0\0009\0\1\0009\0\3\0)\2\0\0B\0\2\2\18\2\0\0009\0\4\0'\3\5\0B\0\3\2\n\0\0\0X\0\4Ä6\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\tquit\bcmd\14NvimTree_\nmatch\22nvim_buf_get_name\19nvim_list_wins\bapi\bvim\2Ù\1\1\0\5\0\17\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\2B\0\2\1K\0\1\0\tview\1\0\1\nwidth\3(\24update_focused_file\1\0\1\venable\2\ffilters\1\0\0\1\0\1\rdotfiles\2\nsetup\14nvim-tree\frequire\rcallback\0\1\0\1\vnested\2\rBufEnter\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÊ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\2\1\3\0\0\blua\ago\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\n∏\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\2\aia\21@parameter.inner\aaa\21@parameter.outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["satellite.nvim"] = {
    config = { "\27LJ\2\nf\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\23excluded_filetypes\1\0\0\1\2\0\0\rNvimTree\nsetup\14satellite\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/satellite.nvim",
    url = "https://github.com/lewis6991/satellite.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n§\5\0\0\t\0'\00066\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\17\0005\4\v\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\0056\6\0\0'\b\3\0B\6\2\0029\6\a\6=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\14\0006\6\0\0'\b\3\0B\6\2\0029\6\r\6=\6\15\5=\5\16\4=\4\18\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3$\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0%\0'\2&\0B\0\2\1K\0\1\0\bfzf\19load_extension\fpickers\19lsp_references\1\0\1\ntheme\rdropdown\14live_grep\1\0\1\ntheme\rdropdown\fbuffers\1\0\1\ntheme\rdropdown\24lsp_implementations\1\0\1\ntheme\rdropdown\25lsp_document_symbols\1\0\1\ntheme\rdropdown\"lsp_dynamic_workspace_symbols\1\0\1\ntheme\rdropdown\15find_files\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\1\0\0\6n\6x\1\0\0\18delete_buffer\6i\1\0\0\n<C-h>\1\2\1\0\f<c-s-w>\ttype\fcommand\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\22telescope.actions\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nÉ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\23filetypes_denylist\1\3\0\0\rNvimTree\20TelescopePrompt\1\0\1\ndelay\3\0\14configure\15illuminate\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/subramaniraju/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\28show_first_indent_level\1#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\2\aia\21@parameter.inner\aaa\21@parameter.outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\4\0\b\1\0236\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\0\0\0\t\0\0\0X\0\15Ä6\0\0\0009\0\1\0009\0\3\0)\2\0\0B\0\2\2\18\2\0\0009\0\4\0'\3\5\0B\0\3\2\n\0\0\0X\0\4Ä6\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\tquit\bcmd\14NvimTree_\nmatch\22nvim_buf_get_name\19nvim_list_wins\bapi\bvim\2Ù\1\1\0\5\0\17\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\0025\3\15\0=\3\16\2B\0\2\1K\0\1\0\tview\1\0\1\nwidth\3(\24update_focused_file\1\0\1\venable\2\ffilters\1\0\0\1\0\1\rdotfiles\2\nsetup\14nvim-tree\frequire\rcallback\0\1\0\1\vnested\2\rBufEnter\24nvim_create_autocmd\bapi\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nı\3\0\0\b\0\28\00086\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\2\0039\3\5\0035\4\6\0B\1\3\2=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\2\0039\3\b\0035\4\t\0B\1\3\2=\1\a\0006\0\n\0'\2\v\0B\0\2\0029\0\f\0B\0\1\0026\1\n\0'\3\r\0B\1\2\0029\1\14\0019\1\15\0015\3\23\0005\4\21\0005\5\19\0005\6\17\0005\a\16\0=\a\18\6=\6\20\5=\5\22\4=\4\24\3=\0\25\3B\1\2\0016\1\n\0'\3\r\0B\1\2\0029\1\26\0019\1\15\0015\3\27\0=\0\25\3B\1\2\1K\0\1\0\1\0\0\ngopls\17capabilities\rsettings\1\0\0\bLua\1\0\0\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\nsetup\16sumneko_lua\14lspconfig\25default_capabilities\17cmp_nvim_lsp\frequire\1\0\1\vborder\frounded\19signature_help\31textDocument/signatureHelp\1\0\1\vborder\frounded\nhover\twith\23textDocument/hover\rhandlers\blsp\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1¿\tbody\15lsp_expand_\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\fluasnip\b‚ãó\vbuffer\aŒ©\rnvim_lsp\aŒª\tpath\tüñ´ı\1\0\1\a\2\v\2)6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\5Ä-\2\0\0009\2\5\2-\4\1\0B\2\2\1X\2\24Ä\b\1\1\0X\2\16Ä6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3Ä\18\2\0\0B\2\1\1X\2\3Ä-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0¿\2¿\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0X\0\1\4\2\2\0\r-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1-\3\1\0B\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\21select_prev_item\fvisibleï\6\1\0\v\0003\0Z6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0009\3\3\0009\3\4\3=\3\6\0029\3\a\0005\5\v\0005\6\t\0003\a\b\0=\a\n\6=\6\f\0059\6\r\0009\6\14\0064\b\5\0005\t\15\0>\t\1\b5\t\16\0>\t\2\b5\t\17\0>\t\3\b5\t\18\0>\t\4\bB\6\2\2=\6\14\0055\6\21\0009\a\r\0009\a\19\a9\a\20\aB\a\1\2=\a\22\6=\6\19\0055\6\24\0005\a\23\0=\a\25\0063\a\26\0=\a\27\6=\6\28\0055\6\31\0009\a\29\0009\a\30\a\18\t\2\0B\a\2\2=\a \0069\a\29\0009\a!\a\18\t\2\0B\a\2\2=\a\"\0069\a\29\0009\a#\a5\t$\0B\a\2\2=\a%\0069\a\29\0003\t&\0005\n'\0B\a\3\2=\a(\0069\a\29\0003\t)\0005\n*\0B\a\3\2=\a+\6=\6\29\5B\3\2\0019\3\a\0009\3,\3'\5-\0005\6/\0009\a\29\0009\a.\a9\a,\aB\a\1\2=\a\29\0064\a\4\0005\b0\0>\b\1\a5\b1\0>\b\2\a5\b2\0>\b\3\a=\a\14\6B\3\3\0012\0\0ÄK\0\1\0\1\0\1\tname\20cmdline_history\1\0\1\tname\tpath\1\0\1\tname\fcmdline\1\0\0\vpreset\6:\fcmdline\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\v<Down>\21select_next_item\t<Up>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\18documentation\1\0\0\rbordered\vwindow\1\0\1\tname\tcalc\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\rbehavior\1\0\0\vSelect\19SelectBehavior\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\22goimports | gofmt\nstdin\2‚\1\1\0\b\0\14\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5>\5\1\4=\4\6\0034\4\3\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5>\5\1\4=\4\t\0034\4\3\0003\5\n\0>\5\1\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\rfiletype\1\0\0\ago\0\tjson\ajq\29formatter.filetypes.json\blua\1\0\0\vstylua\28formatter.filetypes.lua\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÊ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\2\1\3\0\0\blua\ago\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\23filetypes_denylist\1\3\0\0\rNvimTree\20TelescopePrompt\1\0\1\ndelay\3\0\14configure\15illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\22execution_message\1\0\0\1\0\1\fmessage\5\nsetup\14auto-save\frequire\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nœ\2\0\0\4\0\20\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0014\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0005\1\n\0005\2\v\0>\2\2\1=\1\t\0005\1\r\0005\2\14\0>\2\2\1=\1\f\0005\1\16\0005\2\17\0>\2\2\1=\1\15\0006\1\0\0'\3\18\0B\1\2\0029\1\19\1\18\3\0\0B\1\2\1K\0\1\0\17set_mappings\21neoscroll.config\1\2\0\0\a50\1\2\0\0\azb\azb\1\2\0\0\a50\1\2\0\0\azz\azz\1\2\0\0\a50\1\2\0\0\azt\azt\1\4\0\0\18vim.wo.scroll\ttrue\a50\1\2\0\0\vscroll\n<C-d>\1\4\0\0\19-vim.wo.scroll\ttrue\a50\1\2\0\0\vscroll\n<C-u>\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n§\5\0\0\t\0'\00066\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\17\0005\4\v\0005\5\5\0006\6\0\0'\b\3\0B\6\2\0029\6\4\6=\6\6\0056\6\0\0'\b\3\0B\6\2\0029\6\a\6=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\14\0006\6\0\0'\b\3\0B\6\2\0029\6\r\6=\6\15\5=\5\16\4=\4\18\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\3=\3$\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0%\0'\2&\0B\0\2\1K\0\1\0\bfzf\19load_extension\fpickers\19lsp_references\1\0\1\ntheme\rdropdown\14live_grep\1\0\1\ntheme\rdropdown\fbuffers\1\0\1\ntheme\rdropdown\24lsp_implementations\1\0\1\ntheme\rdropdown\25lsp_document_symbols\1\0\1\ntheme\rdropdown\"lsp_dynamic_workspace_symbols\1\0\1\ntheme\rdropdown\15find_files\1\0\0\1\0\1\ntheme\rdropdown\rdefaults\1\0\0\rmappings\1\0\0\6n\6x\1\0\0\18delete_buffer\6i\1\0\0\n<C-h>\1\2\1\0\f<c-s-w>\ttype\fcommand\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\22telescope.actions\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ago\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\27automatic_installation\2\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: satellite.nvim
time([[Config for satellite.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\23excluded_filetypes\1\0\0\1\2\0\0\rNvimTree\nsetup\14satellite\frequire\0", "config", "satellite.nvim")
time([[Config for satellite.nvim]], false)
-- Config for: gruvbox-material
time([[Config for gruvbox-material]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0!colorscheme gruvbox-material\bcmd\bvim\0", "config", "gruvbox-material")
time([[Config for gruvbox-material]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\6\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0004\4\3\0005\5\6\0>\5\1\4=\4\b\0035\4\n\0005\5\t\0>\5\1\4=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\rsections\14lualine_x\1\2\0\0\rfiletype\14lualine_b\1\3\0\0\0\16diagnostics\1\2\1\0\vbranch\ticon\bÔêò\14lualine_c\1\0\0\1\2\2\0\rfilename\tpath\3\1\16file_status\1\foptions\1\0\0\1\0\2\18icons_enabled\2\ntheme\21gruvbox-material\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: cutlass.nvim
time([[Config for cutlass.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fexclude\1\0\0\1\3\0\0\and\axd\nsetup\fcutlass\frequire\0", "config", "cutlass.nvim")
time([[Config for cutlass.nvim]], false)

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
