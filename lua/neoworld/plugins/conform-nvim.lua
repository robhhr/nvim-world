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
    php = { "php_cs_fixer" },
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
    php_cs_fixer = {
      command = "./vendor/bin/php-cs-fixer",
      args = { "fix", "--quiet", "--using-cache=no", "$FILENAME" },
      stdin = false, -- it edits files directly
      cwd = require("conform.util").root_file({ ".php-cs-fixer.php", "composer.json", ".git" }),
      condition = function(_)
        return vim.fn.filereadable("./vendor/bin/php-cs-fixer") == 1
      end,
    },
  },
})
