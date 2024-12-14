local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

mason.setup({})
mason_lspconfig.setup({
  ensure_installed = {
    'eslint',
    'ts_ls',
    'intelephense',
    'lua_ls',
    'tailwindcss',
    'cssls',
    'html',
    'vimls',
  },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        local buf_map = vim.api.nvim_buf_set_keymap

        buf_map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_map(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_map(bufnr, "n", "<C-[>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              if vim.g.format_on_save then
                -- vim.lsp.buf.format({ bufnr = bufnr, async = false })
                vim.lsp.buf.format({ async = false })
              end
            end,
          })
        end
      end,
    })
  end,

  ["intelephense"] = function()
    lspconfig.intelephense.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            if vim.g.format_on_save then
              vim.lsp.buf.format({ async = false })
              -- vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end
          end,
        })
      end
    })
  end,

  ["ts_ls"] = function()
    lspconfig.ts_ls.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false -- Eslint handles formatting
        local opts = { noremap = true, silent = true }
        local buf_map = vim.api.nvim_buf_set_keymap

        buf_map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_map(bufnr, "n", "<C-[>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      end,
    })
  end,

  ["eslint"] = function()
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
      end,
    })
  end,

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
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
    })
  end,

  ["tailwindcss"] = function()
    lspconfig.tailwindcss.setup({
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
        "php",
        "blade",
        "markdown",
      },
    })
  end,

  ["cssls"] = function()
    lspconfig.cssls.setup({
      capabilities = vim.tbl_extend("keep", vim.lsp.protocol.make_client_capabilities(), {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
            },
          },
        },
      }),
      filetypes = { "css", "scss", "less", "html", "php" }, -- support for CSS and embedded CSS
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        local buf_map = vim.api.nvim_buf_set_keymap

        buf_map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              if vim.g.format_on_save then
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
              end
            end,
          })
        end
      end,
    })
  end,

  ["html"] = function()
    lspconfig.html.setup({
      capabilities = vim.tbl_extend("keep", vim.lsp.protocol.make_client_capabilities(), {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
            },
          },
        },
      }),
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        local opts = { noremap = true, silent = true }
        local buf_map = vim.api.nvim_buf_set_keymap

        buf_map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      end,
    })
  end,
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = {
        menu = 50,
        abbr = 50,
      },
      ellipsis_char = '...',
      show_labelDetails = true,
      before = function(entry, vim_item)
        return vim_item
      end
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
})
