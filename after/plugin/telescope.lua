local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gp', function()
  builtin.grep_string({ search = vim.fn.input("Grep >") });
end)

telescope.setup({
  defaults = {
    path_display = { "absolute" },
    file_ignore_patterns = {
      ".git/",
      "node_modules/*",
      "^wp-admin/",
      "^wp-includes/",
      "%.css"
    }
  }
})
