-- core non-plugin keymaps
local keymap = vim.keymap
vim.g.mapleader = ","

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>Q", ":q!<CR>")
keymap.set("n", "<leader>so", ":so<CR>")

-- v mode moving lines up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<leader>v", "<C-v>")

keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clip
keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

-- quick substitute current word
keymap.set("n", "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "<leader><Right>", ":bnext<CR>")
keymap.set("n", "<leader><Left>", ":bprev<CR>")

keymap.set("n", "<C-q>", ":bdelete! %<CR>")

