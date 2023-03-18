require('neo-tree').setup({
  close_if_last_window = true,
  window = {
    position = 'right',
    width = 30,
  },
  filesystem = {
    filtered_items = {
      hide_by_name = {
        'node_modules'
      },
      hide_dotfiles = false,
      hide_gitignore = false,
      visible = true
    },
    follow_current_file = true,
  },
})

