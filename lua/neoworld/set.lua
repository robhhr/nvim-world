vim.lsp.set_log_level("ERROR")
vim.g.have_nerd_font = true

-- gruvbox reads vim.o.background natively ("light"/"dark"); mode comes from the
-- system theme file via the shared reader in utils/theme.
vim.o.background = require("neoworld.utils.theme").read_mode()

local options = {
  backup = false,
  breakindent = true,
  breakindentopt = { 'shift:2', 'min:20', 'sbr' },
  cmdheight = 2,
  -- cursorline = true,
  encoding = 'utf-8',
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
