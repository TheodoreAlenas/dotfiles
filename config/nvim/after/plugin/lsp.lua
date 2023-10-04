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

  s("n", "gd", vim.lsp.buf.definition, opts)
  s("n", "gD", vim.lsp.buf.declaration, opts)
  s("n", "gy", vim.lsp.buf.type_definition, opts)
  s("n", "gI", vim.lsp.buf.implementation, opts)
  s("n", "gr", vim.lsp.buf.references, opts)
  s("n", "gA", vim.lsp.buf.code_action, opts)
  s("n", "K", vim.lsp.buf.hover, opts)
  s("n", "<leader>k", vim.diagnostic.open_float, opts)
  s("n", "]d", vim.diagnostic.goto_next, opts)
  s("n", "[d", vim.diagnostic.goto_prev, opts)
  s("n", "<leader>r", vim.lsp.buf.rename, opts)
  s("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()
