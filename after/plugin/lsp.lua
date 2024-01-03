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
  'prismals',
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

require('lspconfig').cssls.setup {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
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

require 'lspconfig'.prismals.setup {}

lsp.on_attach(function(client, bufnr)
  local maps = vim.keymap.set
  local opts_l = { silent = true, noremap = true }

  maps('n', 'K', vim.lsp.buf.hover, opts_l)
  maps({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts_l)
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
    ['tsserver'] = { 'js' },
    ['prismals'] = { 'prisma' },
  }
})

require('ufo').setup()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
    {
      name = "copilot",
      -- keyword_length = 0,
      max_item_count = 3,
      trigger_characters = {
        {
          ".",
          ":",
          "(",
          "'",
          '"',
          "[",
          ",",
          "#",
          "*",
          "@",
          "|",
          "=",
          "-",
          "{",
          "/",
          "\\",
          "+",
          "?",
          " ",
        },
      },
      group_index = 2,
    },
  },
  mapping = {
    ['<C-Space>'] = cmp_action.tab_complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<M-Right>'] = cmp.mapping(function()
      vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n',
        true)
    end),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
  }
})

lsp.setup()
