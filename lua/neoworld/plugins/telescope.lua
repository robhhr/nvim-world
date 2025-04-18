local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    path_display = { "absolute" },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
    git_files = {
      theme = 'dropdown'
    },
    live_grep = {
      theme = 'dropdown'
    },
    buffers = {
      theme = 'dropdown'
    },
    current_buffer_fuzzy_find = {
      theme = 'dropdown'
    },
  }
})
