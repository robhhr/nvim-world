local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

mason.setup({})

local ensure_installed = {
  'eslint',
  'ts_ls',
  'intelephense',
  'lua_ls',
  'tailwindcss',
  'cssls',
  'html',
  'vimls',
  'pyright',
  'ruff',
  'graphql',
  'gopls'
}

mason_lspconfig.setup({
  ensure_installed = ensure_installed,
  automatic_enable = true,
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

local function lsp_config(server_name, opts)
  if vim.lsp.config then
    vim.lsp.config(server_name, opts)
  else
    lspconfig[server_name].setup(opts)
  end
end

local default_opts = {
  on_attach = common_on_attach,
}

local custom_opts = {
  intelephense = {
    root_markers = { "wp-config.php", "wp-includes", "index.php" },
  },
  ts_ls = {
    on_attach = function(_, bufnr)
      vim.lsp.handlers['textDocument/definition'] = function() end
      vim.lsp.handlers['textDocument/references'] = function() end
      common_on_attach(_, bufnr)
    end,
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim", "hl" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  tailwindcss = {
    filetypes = {
      "html",
      "css",
      "scss",
      "sass",
      "postcss",
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
  },
  cssls = {
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
  },
  html = {
    capabilities = vim.tbl_extend("keep", vim.lsp.protocol.make_client_capabilities(), {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    }),
  },
  ruff = {
    init_options = {
      settings = {
        args = {}, -- you can pass config args here if not using pyproject.toml
      },
    },
  },
  graphql = {
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    root_dir = lspconfig.util.root_pattern(".graphqlrc*", "graphql.config.*", ".git"),
  },
}

for _, server_name in ipairs(ensure_installed) do
  local opts = vim.tbl_deep_extend("force", {}, default_opts, custom_opts[server_name] or {})
  lsp_config(server_name, opts)
end

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
