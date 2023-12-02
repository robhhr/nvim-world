local global = vim.g
local keymap = vim.keymap

global.mapleader = ","

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

keymap.set("n", "<leader>h", ":HopWord<CR>")

keymap.set("n", "<leader>p", ":Neoformat prettier<CR>")

keymap.set("n", "<leader>g", ":Neogit<CR>")

vim.api.nvim_create_autocmd({ "BufWritePre" },
  {
    group = vim.api.nvim_create_augroup('UserOnSave', {}),
    pattern = '*',
    callback = function()
      local n_lines = vim.api.nvim_buf_line_count(0)
      local last_nonblank = vim.fn.prevnonblank(n_lines)
      if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' }) end
    end,
  })

