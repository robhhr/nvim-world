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

keymap.set("n", "<leader>v", "<C-v>")

keymap.set("x", "<leader>p", "\"_dP")

keymap.set("n", "<leader>y", "\"+y")
keymap.set("v", "<leader>y", "\"+y")
keymap.set("n", "<leader>Y", "\"+Y")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader><Right>", ":bnext<CR>")
keymap.set("n", "<leader><Left>", ":bprev<CR>")

keymap.set("n", "<C-q>", ":bdelete! %<CR>")

keymap.set("n", "<leader><Space>", ":Twilight<CR>")

keymap.set('n', '<tab>',
  function()
    return require('fold-cycle').open()
  end,
  { silent = true, desc = 'Fold-cycle: open folds' }
)

keymap.set('n', '<s-tab>',
  function()
    return require('fold-cycle').close()
  end,
  { silent = true, desc = 'Fold-cycle: close folds' }
)

keymap.set("n", "<leader>h", ":HopWord<CR>")

keymap.set("n", "<leader>g", ":LazyGit<CR>")

vim.api.nvim_create_autocmd({ "BufWritePre" },
  {
    group = vim.api.nvim_create_augroup('UserOnSave', {}),
    pattern = '*',
    callback = function()
      local n_lines = vim.api.nvim_buf_line_count(0)
      local last_nonblank = vim.fn.prevnonblank(n_lines)
      if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' }) end
    end,
  }
)
