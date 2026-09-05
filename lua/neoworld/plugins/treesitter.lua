local ts = require('nvim-treesitter')

ts.setup()

local ensure = {
  -- languages
  "javascript", "typescript", "tsx", "json", "html", "css", "scss",
  "lua", "vim", "php", "rust",
  "astro",
  "go", "gomod", "gosum",
  "bash", "markdown", "yaml", "toml", "dockerfile", "sql",
  "graphql", -- paired with the graphql LSP in lsp.lua
  "gitcommit", "gitignore", "git_config",
  "printf",  -- Go format verbs: %v, %.2f in Printf/Sprintf/Errorf/...
  "regex",   -- Go regexp.MustCompile(...) + JS regex literals
  "comment", -- TODO/FIXME/@param etc. inside comments
}

local installed = ts.get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(installed, lang)
end, ensure)
if #missing > 0 then
  ts.install(missing)
end

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
