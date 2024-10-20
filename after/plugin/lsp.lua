local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

mason.setup({})

mason_lspconfig.setup({
  ensure_installed = {
    'eslint',
    -- 'tsserver',
    'ts_ls',
    'intelephense',
    'lua_ls',
    'cssls',
  },
  handlers = {
    function(server_name)
      lsp_zero.default_setup(server_name)
    end,

    ["ts_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end
      })
    end,

    ["eslint"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              if vim.g.format_on_save then
                vim.cmd([[EslintFixAll]])
              end
            end,
          })
        end
      })
    end,

    ["intelephense"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.intelephense.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              if vim.g.format_on_save then
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
              end
            end,
          })
        end
      })
    end,

    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = true
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              if vim.g.format_on_save then
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
              end
            end,
          })
        end,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          }
        }
      })
    end
  }
})

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),  -- jump forward in snippets
    ['<C-b>'] = cmp_action.luasnip_jump_backward(), -- jump backward in snippets
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    -- ['<M-Right>'] = cmp.mapping(function()
    --   vim.api.nvim_feedkeys(vim.fn['codeium#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n',
    --     true)
    -- end),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true, -- automatically select first item
    }),
  }
})
