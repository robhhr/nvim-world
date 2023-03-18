local options = {
	background = 'dark',
	cmdheight = 2,
	cursorline = true,
	expandtab = true,
  fileencoding = 'utf-8',
  nu = true,
  relativenumber = true,
  smarttab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  wrap = true,
  swapfile = false,
  backup = false,
  undofile = true,
  hlsearch = false,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,
  signcolumn = "yes",
  updatetime = 50,
  colorcolumn = "80",
}

for i, j in pairs(options) do
		vim.opt[i] = j
end
