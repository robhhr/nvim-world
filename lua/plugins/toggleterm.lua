local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  direction = 'float',
  float_opts = {
    border = 'curved',
    height = 30,
    width = 60,
  }
})
