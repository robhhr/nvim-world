local lsp_installer = require("nvim-lsp-installer")
local lspkind = require("lspkind")
local opts = { noremap = true, silent = true }
local status, nvim_lsp = pcall(require, "lspconfig")

lspkind.init({
  mode = "symbol",
})

local on_attach = function(client, bufnr)
  -- enable completion by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

local flags = {
  debounce_text_changes = 150,
}

local settings = {
  intelephense = {
      stubs = {
          "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib", "wordpress", "phpunit",
      },
      diagnostics = {
          enable = true,
      },
  },
  Lua = {
      diagnostics = {
          globals = { "vim" },
      },
  },
  json = {
      schemas = {
       {
        description = "NPM configuration file",
        fileMatch = {
         "package.json",
        },
        url = "https://json.schemastore.org/package.json",
       },
      },
  },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- lsp_installer.on_server_ready(function(server)
--   server:setup({
--     on_attach = on_attach,
--     flags = flags,
--     settings = settings,
--     handlers = handlers,
--     capabilities = capabilities,
--   })
-- end)

vim.diagnostic.config({
  update_in_insert = true,
  float = {
      border = "rounded",
  },
})

nvim_lsp.intelephense.setup {
  on_attach = on_attach,
  filetypes = { "php" },
  cmd = { "intelephense", "--stdio" },
  settings = settings
}
