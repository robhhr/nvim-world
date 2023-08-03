require('toggleterm').setup {
  size = 5,
  open_mapping = [[<c-z>]],
  direction = 'float',
  float_opts = {
    border = 'double',
    width = 80,
    height = 20,
    winblend = 3,
    zindex = 1,
  },
}
