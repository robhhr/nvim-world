local ts = require('nvim-treesitter')

-- nvim-treesitter `main` branch: setup() only accepts `install_dir` (default is fine).
-- It does NOT support `ensure_installed` or `auto_install` — those are master-branch
-- options and are silently ignored here. Parsers must be installed explicitly.
ts.setup()

local ensure = {
  -- languages
  "javascript", "typescript", "tsx", "json", "html", "css", "scss",
  "lua", "vim", "php", "rust",
  "go", "gomod", "gosum",
  -- config / docs / data formats
  "bash", "markdown", "yaml", "toml", "dockerfile", "sql",
  "graphql", -- paired with the graphql LSP in lsp.lua
  "gitcommit", "gitignore", "git_config",
  -- injected sub-grammars (highlight foreign content embedded in strings/comments)
  "printf",  -- Go format verbs: %v, %.2f in Printf/Sprintf/Errorf/...
  "regex",   -- Go regexp.MustCompile(...) + JS regex literals
  "comment", -- TODO/FIXME/@param etc. inside comments
}

-- Explicit replacement for `ensure_installed`: install only what's missing.
-- install() is async and compiles via the tree-sitter CLI (needs CLI >= 0.26.1).
local installed = ts.get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(installed, lang)
end, ensure)
if #missing > 0 then
  ts.install(missing)
end

-- highlighting is not auto-enabled on `main`; start it per buffer for any
-- filetype that has a parser (pcall swallows the error when none exists).
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
