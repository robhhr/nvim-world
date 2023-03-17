local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- exit
keymap("n", "<leader>q", ":q<CR>", opts)

-- exit w/o save
keymap("n", "<leader>Q", ":q!<CR>", opts)

-- save
keymap("n", "<leader>s", ":w<CR>", opts)

-- save & format (prettier supported)
keymap("n", "<leader>p", ":Prettier<CR> <BAR> :w<CR>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fl", ":Telescope live_grep<CR>", opts)

-- nvim tree
keymap("n", "<leader><Tab>", ":NvimTreeToggle<CR>", opts)

-- force close buffer tab
keymap("n", "<leader>w", ":Bwipeout!<CR>", opts)

-- toggle next buffer
keymap("n", "<leader><Right>", ":BufferLineCycleNext<CR>", opts)

-- toggle prev buffer
keymap("n", "<leader><Left>", ":BufferLineCyclePrev<CR>", opts)

-- toggle term
keymap("n", "<S-Down>", ":ToggleTerm<CR>", opts)

-- registers
keymap("n", "<leader>yy", ":Registers<CR>", opts)

-- emoji/symbol picker
keymap("n", "<leader>em", ":IconPickerNormal<CR>", opts)

-- reload config file
keymap("n", "<leader>rel", ":luafile ~/.config/nvim/lua/init.lua<CR>", opts)

