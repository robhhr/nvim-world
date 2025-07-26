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
    php = { "intelephense" },
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
    python = { "ruff" },
  },
  formatters = {
    prettier = {
      command = "./node_modules/.bin/prettier",
      args = { "--stdin-filepath", "$FILENAME" },
      cwd = require("conform.util").root_file({ ".prettierrc", "package.json", ".git" }),
    },
    ruff = {
      command = "ruff",
      args = { "format", "-" },
      cwd = require("conform.util").root_file({ "pyproject.toml", ".git" }),
    },
  },
})
