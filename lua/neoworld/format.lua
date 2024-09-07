vim.g.format_on_save = true

function ToggleFormatOnSave()
  vim.g.format_on_save = not vim.g.format_on_save
  if vim.g.format_on_save then
    print("format: enabled")
  else
    print("format: disabled")
  end
end

vim.api.nvim_set_keymap('n', '<leader>fp', ':!prettier --write %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', ':lua ToggleFormatOnSave()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_augroup("FormatOnSaveGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "FormatOnSaveGroup",
  pattern = "*",
  callback = function()
    if vim.g.format_on_save then
      vim.lsp.buf.format({ async = false })
    end
  end,
})
