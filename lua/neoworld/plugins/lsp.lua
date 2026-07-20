local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

mason.setup({})

vim.o.winborder = "rounded"

vim.diagnostic.config({
  float = { source = true },
})

local ensure_installed = {
  'eslint',
  'ts_ls',
  'intelephense',
  'lua_ls',
  'tailwindcss',
  'cssls',
  'html',
  'vimls',
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

-- add nvim-cmp's richer completion capabilities to every server
local capabilities = cmp_nvim_lsp.default_capabilities()

local default_opts = {
  on_attach = common_on_attach,
  capabilities = capabilities,
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
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore"
        }
      }
    },
    filetypes = { "css", "scss", "less" },
  },
  graphql = {
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
    root_dir = lspconfig.util.root_pattern(".graphqlrc*", "graphql.config.*", ".git"),
  },
  gopls = {
    settings = {
      gopls = {
        staticcheck = true,
        analyses = {
          unusedparams = true,
          unusedwrite = true,
          nilness = true,
          useany = true,
        },
      },
    },
  },
}

for _, server_name in ipairs(ensure_installed) do
  local opts = vim.tbl_deep_extend("force", {}, default_opts, custom_opts[server_name] or {})
  lsp_config(server_name, opts)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    local client = vim.lsp.get_clients({ bufnr = args.buf, name = "gopls" })[1]
    if not client then
      return
    end

    local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
    params.context = { only = { "source.organizeImports" }, diagnostics = {} }

    local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 1000)
    for _, res in pairs(result or {}) do
      for _, action in pairs(res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
        end
      end
    end
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
