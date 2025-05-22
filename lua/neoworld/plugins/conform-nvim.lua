local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  format_on_save = function()
    if vim.g.format_on_save then
      return {
        lsp_fallback = true,
        async = false,
      }
    end
  end,
  formatters_by_ft = {
    lua = { "stylua" },
    php = { "phpcbf_local", "phpcbf" },
    javascript = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },
    javascriptreact = { "eslint_d", "prettier" },
    typescriptreact = { "eslint_d", "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
  },
  formatters = {
    prettier = {
      command = "./node_modules/.bin/prettier",
      args = { "--stdin-filepath", "$FILENAME" },
      cwd = require("conform.util").root_file({ ".prettierrc", "package.json", ".git" }),
    },
    phpcbf_local = {
      command = "./vendor/bin/phpcbf",
      args = { "--stdin-path=$FILENAME", "-" },
      cwd = require("conform.util").root_file({ "composer.json", "phpcs.xml", ".git" }),
      condition = function(_)
        -- only use if vendor/bin/phpcbf exists
        return vim.fn.filereadable("./vendor/bin/phpcbf") == 1
      end,
    },
  },
})
