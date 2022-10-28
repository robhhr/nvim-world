local status_ok, registers = pcall(require, 'registers')
if not status_ok then
  return
end

registers.setup({
  window = {
    max_width = 85,
    border = 'single',
    transparency = 0,
  }
})
