local o = vim.opt

o.cursorline   = false
o.cursorcolumn = false
o.scrolloff    = 0
o.termguicolors= false
o.incsearch    = true
o.hlsearch     = false

o.signcolumn     = 'yes'
--o.colorcolumn    = {80}

o.wrap           = true

o.listchars = {
  tab   = 'T_',
  trail = '-',
  nbsp  = '+',
}

o.list = false

local tab_size = 4
o.tabstop     = tab_size
o.shiftwidth  = tab_size
o.softtabstop = tab_size
o.expandtab = true

-- Latex issues
vim.g.tex_flavor = 'latex'

