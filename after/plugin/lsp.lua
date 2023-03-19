local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.ensure_installed({
  'eslint',
  'cssls',
  'cssmodules_ls',
  'html',
  'intelephense',
  'jsonls',
  'lua_ls',
  'rust_analyzer',
  'tsserver',
})

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_server_config({
  single_file_support = false,
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
})

lsp.format_on_save({
  servers = {
    ['intelephense'] = { 'php' },
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust', 'rs' },
    ['tsserver'] = { 'js' }
  }
})

require('ufo').setup()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

lsp.setup()
