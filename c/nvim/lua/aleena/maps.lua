vim.g.mapleader = " "

vim.cmd[[abbreviate dn deez nuts]]
vim.cmd[[abbreviate shec # shellcheck disable=SC2016]]

function ToggleLineInfo()
    local v = not vim.opt.cursorline._value
    vim.opt.cursorline = v
    vim.opt.cursorcolumn = v
end

vim.keymap.set("n", "<C-g>", ToggleLineInfo)
vim.cmd[[nnoremap <C-g> ]]
