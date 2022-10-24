local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- exit w/o save
keymap("n", "<leader>q", ":q!<CR>", opts)

-- exit w/ save
keymap("n", "<leader>wq", ":wq!<CR>", opts)

-- save
keymap("n", "<leader>w", ":w<CR>", opts)

-- reload config file
keymap("n", "<leader>sv", ":luafile ~/.config/nvim/lua/init.lua<CR>", opts)
