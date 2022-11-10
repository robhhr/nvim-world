require("nvim-treesitter.configs").setup({
  ensure_installed = {"html", "css", "json", "javascript", "lua", "markdown", "php", "scss", "tsx", "typescript"},
  sync_installed = false,
  highlight = {
   enable = true,
   additional_vim_regex_highlighting = { "php" },
  },
  indent = {
   enable = false, -- Really breaks stuff if true
  },
  incremental_selection = {
   enable = true,
   keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
   },
  },
  autotag = {
    enable = true,
  },
  matchup = {
    enable = true,
  }
 })
