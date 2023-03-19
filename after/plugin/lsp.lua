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
  'pyright',
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

require('lspconfig').pyright.setup {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      configurationSources = { 'flake8' },
      plugins = {
        pycodestyle = { enabled = false },
        flake8 = {
          enabled = true,
          ignore = {},
        }
      }
    }
  }
})

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
    ['pyright'] = { 'py' },
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
    ['<C-Space>'] = cmp_action.tab_complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }
})

lsp.setup()
