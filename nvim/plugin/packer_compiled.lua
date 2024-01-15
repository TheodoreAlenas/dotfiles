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
local package_path_str = "/home/aleena/.cache/nvim/packer_hererocks/2.1.1697887905/share/lua/5.1/?.lua;/home/aleena/.cache/nvim/packer_hererocks/2.1.1697887905/share/lua/5.1/?/init.lua;/home/aleena/.cache/nvim/packer_hererocks/2.1.1697887905/lib/luarocks/rocks-5.1/?.lua;/home/aleena/.cache/nvim/packer_hererocks/2.1.1697887905/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aleena/.cache/nvim/packer_hererocks/2.1.1697887905/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nû\6\0\0\5\0/\0;6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\a\0005\4\b\0=\4\t\0035\4\n\0=\4\v\3=\3\r\0025\3\14\0=\3\15\0024\3\0\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0005\4\24\0=\4\25\0035\4\26\0=\4\27\3=\3\28\0025\3\30\0005\4\29\0=\4\31\0035\4 \0=\4!\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3$\0025\3&\0005\4%\0=\4'\0035\4(\0=\4)\3=\3*\0025\3+\0004\4\0\0=\4,\0034\4\0\0=\4-\3=\3.\2B\0\2\1K\0\1\0\fdisable\14filetypes\rbuftypes\1\0\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\20triggers_nowait\vhidden\vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\1\3\2\3\1\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\4\vborder\tnone\rposition\vbottom\vzindex\3è\a\rwinblend\3\0\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\1\0\3\15breadcrumb\6>\ngroup\6+\14separator\6|\fmotions\1\0\1\ncount\2\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\4\19ignore_missing\1\14show_keys\2\14show_help\2\rtriggers\tauto\fpresets\1\0\a\14operators\1\fmotions\1\fwindows\2\17text_objects\1\bnav\2\6z\2\6g\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/home/aleena/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nû\6\0\0\5\0/\0;6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\a\0005\4\b\0=\4\t\0035\4\n\0=\4\v\3=\3\r\0025\3\14\0=\3\15\0024\3\0\0=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0=\3\22\0025\3\23\0005\4\24\0=\4\25\0035\4\26\0=\4\27\3=\3\28\0025\3\30\0005\4\29\0=\4\31\0035\4 \0=\4!\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3$\0025\3&\0005\4%\0=\4'\0035\4(\0=\4)\3=\3*\0025\3+\0004\4\0\0=\4,\0034\4\0\0=\4-\3=\3.\2B\0\2\1K\0\1\0\fdisable\14filetypes\rbuftypes\1\0\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\20triggers_nowait\vhidden\vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\1\3\2\3\1\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\4\vborder\tnone\rposition\vbottom\vzindex\3è\a\rwinblend\3\0\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\nicons\1\0\3\15breadcrumb\6>\ngroup\6+\14separator\6|\fmotions\1\0\1\ncount\2\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\4\19ignore_missing\1\14show_keys\2\14show_help\2\rtriggers\tauto\fpresets\1\0\a\14operators\1\fmotions\1\fwindows\2\17text_objects\1\bnav\2\6z\2\6g\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\14registers\2\nmarks\2\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)

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
