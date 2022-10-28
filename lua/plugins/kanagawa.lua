local status_ok, kanagawa = pcall(require, 'kanagawa')
if not status_ok then
  return
end

kanagawa.setup({})

vim.cmd[[silent! colorscheme kanagawa]]
