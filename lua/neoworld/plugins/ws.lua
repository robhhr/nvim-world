local status_ok, codeium = pcall(require, "codeium")
if not status_ok then
  return
end

codeium.setup({
  enable_cmp_source = false,
  virtual_text = {
    enabled = true,
    filetypes = {
      python = false,
    },
    key_bindings = {
      accept = "<M-Right>",
      accept_word = false,
      accept_line = false,
      clear = "<M-Left>",
      next = "<M-Down>",
      prev = "<M-Up>",
    }
  }
})
