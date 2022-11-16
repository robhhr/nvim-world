local status_ok, tokyonight = pcall(require, 'tokyonight')
if not status_ok then
  return
end

tokyonight.setup({
  style = 'night',
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
})

vim.cmd[[silent! colorscheme tokyonight]]
