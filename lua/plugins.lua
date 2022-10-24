local path = "/Users/robhhr/.config/nvim/lua/plugins/"

-- protected call so packer won't error on first load
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- showcase msgs in a popup
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- plugin listing
require('packer').startup(function(use)
  -- for packer to manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme(s)
  -- use 'projekt0n/github-nvim-theme'
  -- use 'yashguptaz/calvera-dark.nvim'
  use 'marko-cerovac/material.nvim'
end)

-- plugins initializations
dofile(path..'material-theme.lua')
