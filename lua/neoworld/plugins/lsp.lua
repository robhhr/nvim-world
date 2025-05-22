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
    'graphql'
  },
})

-- better to reuse since a lot of the configs are the same
local function common_on_attach(_, bufnr)
  local opts = { noremap = true, silent = true }
  local buf_map = vim.api.nvim_buf_set_keymap

  buf_map(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_map(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- buf_map(bufnr, "n", "<C-[>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
end

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = common_on_attach,
    })
  end,

  ["intelephense"] = function()
    lspconfig.intelephense.setup({
      root_dir = lspconfig.util.root_pattern(
        "wp-config.php",
        "wp-includes",
        "index.php"
      ),
      on_attach = common_on_attach,
    })
  end,

  ["ts_ls"] = function()
    lspconfig.ts_ls.setup({
      on_attach = function(_, bufnr)
        vim.lsp.handlers['textDocument/definition'] = function() end
        vim.lsp.handlers['textDocument/references'] = function() end
        common_on_attach(_, bufnr)
      end,
    })
  end,

  ["eslint"] = function()
    lspconfig.eslint.setup({
      on_attach = common_on_attach,
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
      on_attach = common_on_attach,
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
      on_attach = common_on_attach,
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
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore"
          }
        }
      },
      filetypes = { "css", "scss", "less" },
      on_attach = common_on_attach,
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
      on_attach = common_on_attach,
    })
  end,

  ["graphql"] = function()
    lspconfig.graphql.setup({
      cmd = { "graphql-lsp", "server", "-m", "stream" },
      filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
      root_dir = lspconfig.util.root_pattern(".graphqlrc*", "graphql.config.*", ".git"),
      on_attach = common_on_attach,
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
    { name = 'luasnip', keyword_length = 2 },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer',  keyword_length = 3 },
  },
})
