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
  use({'folke/tokyonight.nvim',
    config = dofile(path..'tokyonight.lua')
  })

  -- treesitter
  use({"nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = dofile(path..'treesitter.lua')
  })

  -- lsp
  use 'williamboman/mason-lspconfig.nvim'
  
  use({'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
      'onsails/lspkind-nvim',   
    },
    config = dofile(path..'lsp-config.lua')
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = dofile(path..'cmp-config.lua')
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    config = dofile(path.."nullls-config.lua")
  })
end)
