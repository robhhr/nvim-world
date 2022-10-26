require("tokyonight").setup({
  style = 'night',
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
})

vim.cmd[[silent! colorscheme tokyonight]]