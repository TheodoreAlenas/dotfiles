
local ts = require 'telescope.builtin'

vim.keymap.set("n", "<leader>e", ts.find_files)
vim.keymap.set("n", "<leader>x", ts.builtin)
