-- plugin disabled

--[[
require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  view = {
    side = "right",
    width = 28
  }
})
--]]
