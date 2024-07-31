vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- commenting bc gruvbox requires init after config
-- vim.cmd('colorscheme gruvbox')

local options = {
  background = 'dark',
  backup = false,
  breakindent = true,
  breakindentopt = { 'shift:2', 'min:20', 'sbr' },
  cmdheight = 2,
  cursorline = true,
  endofline = true,
  expandtab = true,
  fileencoding = 'utf-8',
  foldcolumn = '1',
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  hlsearch = false,
  incsearch = true,
  mouse = '',
  nu = true,
  numberwidth = 4,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  showmode = false,
  signcolumn = "yes",
  smarttab = true,
  softtabstop = 2,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undofile = true,
  updatetime = 50,
  wrap = true,
}

for i, j in pairs(options) do
  vim.opt[i] = j
end
