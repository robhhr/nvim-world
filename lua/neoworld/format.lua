vim.g.format_on_save = false

function ToggleFormatOnSave()
  vim.g.format_on_save = not vim.g.format_on_save
  if vim.g.format_on_save then
    print("format: enabled")
  else
    print("format: disabled")
  end
end

vim.api.nvim_set_keymap('n', '<leader>fp', ':!./node_modules/.bin/prettier --write %<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', ':lua ToggleFormatOnSave()<CR>', { noremap = true, silent = true })

-- format-on-save is handled by conform's built-in `format_on_save`
