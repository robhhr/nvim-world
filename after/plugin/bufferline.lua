require('bufferline').setup {
  options = {
    numbers = "ordinal",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      style = 'underline',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = false
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = false,
    persist_buffer_sort = true,
    separator_style = { '' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    hover = {
      enabled = false,
    },
    sort_by = 'insert_at_end',
  }
}
