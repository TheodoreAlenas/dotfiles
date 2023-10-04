vim.api.nvim_create_augroup('textedit', {clear = true})

vim.api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
  group = "textedit",
  pattern = { "/home/aleena/code/subj/8web/project/*", },
  callback = SetPopTabs
})
vim.cmd[[autocmd BufRead,BufNewFile /home/aleena/code/subj/8web/project/* setlocal ts=4 sw=4 sts=4 noexpandtab]]

-- These don't work for some reason


