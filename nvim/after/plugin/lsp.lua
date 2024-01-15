local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer',
  'tsserver',
  'eslint',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<CR>'] = nil
cmp_mappings['<Return>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  sign_icons = { }
})

lsp.on_attach(function(client, buf)
  local opts = {buffer = buf, remap = false}
  local s = vim.keymap.set

  s("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  s("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  s("n", "gy", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  s("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
  s("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
  s("n", "<leader>A", ":lua vim.lsp.buf.code_action()<CR>", opts)
  s("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  s("n", "<leader>k", ":lua vim.diagnostic.open_float()<CR>", opts)
  s("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
  s("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
  s("n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>", opts)
  s("i", "<C-h>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
end)

lsp.setup()
