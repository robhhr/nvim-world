require 'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  -- a list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "javascript", "json", "lua", "php", "rust", "scss", "typescript", "vim" },

  -- install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- automatically install missing parsers when entering buffer
  -- recommendation: set to false if you don't have `tree-sitter` cli installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
