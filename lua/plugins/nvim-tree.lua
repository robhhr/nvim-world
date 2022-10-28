require('nvim-tree').setup({
  disable_netrw = true,
  open_on_setup = true,
  create_in_closed_folder = true,
  view = {
    hide_root_folder = true,
    side = 'right',
  },
  git = {
    ignore = false,
  },
  renderer = {
    add_trailing = true,
    highlight_opened_files = 'all',
  },
  filters = {
    toggle_dotfiles,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
})
