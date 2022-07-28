require'nvim-treesitter.configs'.setup {
	ensure_installed = { "html", "javascript", "lua", "css", "php" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
    enable = true,
  },
	autotag = {
    enable = true,
	},
	autopairs = {
    enable = true,
	}
}
