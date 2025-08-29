local status_ok, oil = pcall(require, "oil")
if not status_ok then
  return
end

-- open parent directory in current window
vim.keymap.set("n", "<leader><Tab>", "<Cmd>Oil<CR>", { desc = "open parent dir" })

oil.setup({
  columns = {
    "size",
    "icon"
  },
  win_options = {
    signcolumn = "yes:2",
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<M-h>"] = "actions.select_split"
  },
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true
  },
})
