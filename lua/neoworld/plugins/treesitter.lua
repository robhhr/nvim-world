require('nvim-treesitter').setup({
  ensure_installed = { "javascript", "json", "lua", "php", "rust", "scss", "typescript", "vim", "go", "gomod", "gosum" },
  auto_install = true,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gomod', 'gosum' },
  callback = function()
    vim.treesitter.start()
  end,
})
