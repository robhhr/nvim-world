local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  highlights = {
    buffer_selected = {
      bold = true,
      italic = false,
    },
    warning_selected = {
      bold = true,
      italic = false,
    },
    error_selected = {
      bold = true,
      italic = false,
    },
  },
  options = {
    mode = "buffer",
    numbers = "none",
    themable = true,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      style = 'none',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 15,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = false
      }
    },
    color_icons = true,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    show_duplicate_prefix = false,
    persist_buffer_sort = false,
    separator_style = { '' },
    enforce_regular_tabs = true,
    always_show_bufferline = false,
    hover = {
      enabled = false,
    },
    sort_by = 'insert_after_current',
  }
}
