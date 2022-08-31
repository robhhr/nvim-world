local opts = {noremap=true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- save
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<leader>q", ":q!<CR>", opts)

keymap("n", "<leader><tab>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader><tab>", ":NvimTreeToggle<CR>", opts)

keymap("n", "<leader><Right>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader><Left>", ":BufferLineCyclePrev<CR>", opts)

keymap("n", "<leader>ww", ":Bwipeout<CR>", opts)
keymap("n", "<leader>qq", ":Bwipeout!<CR>", opts)

keymap("n", "<leader>p", ":Telescope find_files<CR>", opts)

keymap("n", "<leader>ll", ":luafile ~/.config/nvim/lua/init.lua<CR>", opts)

