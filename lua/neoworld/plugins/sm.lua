local status_ok, sm = pcall(require, "supermaven-nvim")
if not status_ok then
  return
end

sm.setup({
  keymaps = {
    accept_suggestion = "<M-Right>",
    clear_suggestion = "<M-Left>",
    accept_word = "<M-Up>",
  },
  ignore_filetypes = { cpp = true }, -- or { "cpp", }
  color = {
    suggestion_color = "#458588",
    cterm = 244,
  },
  log_level = "info",                -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false,           -- disables built in keymaps
  condition = function()
    return false
  end
})
