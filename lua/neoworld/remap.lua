local global = vim.g
local keymap = vim.keymap

global.mapleader = ","

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>Q", ":q!<CR>")
keymap.set("n", "<leader>so", ":so<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzv")
keymap.set("n", "N", "Nzzv")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader><Right>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<leader><Left>", ":BufferLineCyclePrev<CR>")

keymap.set("n", "<C-q>", ":bdelete! %<CR>")

keymap.set("n", "\\u", ":UrlView<CR>")

keymap.set("n", "zR", require('ufo').openAllFolds)
keymap.set("n", "zM", require('ufo').closeAllFolds)

keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.fn.CocActionAsync("definitionHover")
    vim.lsp.buf.hover()
  end
end)

keymap.set("n", "<leader>h", ":HopWord<CR>")

keymap.set("n", "<leader>p", ":Neoformat prettier<CR>")

keymap.set("n", "<C-p>", ":PackerSync<CR>")

keymap.set("n", "<leader>g", ":Neogit<CR>")
