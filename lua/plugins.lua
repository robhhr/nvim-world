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

  use({'rose-pine/neovim',
    -- config = dofile(path..'rose-pine.lua')
  })

  use({'rebelot/kanagawa.nvim',
    -- config = dofile(path..'kanagawa.lua')
  })

  -- treesitter
  use({"nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = dofile(path..'treesitter.lua')
  })

  -- lsp shenaningans (installer, cmp, snips, format)
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

  use 'muniftanjim/prettier.nvim'

  -- autopairs
  use({
    'windwp/nvim-autopairs',
    config = dofile(path..'nvim-autopairs.lua')
  })

  use 'windwp/nvim-ts-autotag'

  -- status line
  use({
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = dofile(path..'lualine.lua')
  })

  -- telescope
  use({
    'nvim-telescope/telescope.nvim',
    -- also brew install ripgrep && brew install fd to full support wraps/dir search & gitignore
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = dofile(path..'telescope.lua')
  })

  -- git signs
  use({
    'lewis6991/gitsigns.nvim',
    config = dofile(path..'gitsigns.lua')
  })

  -- nvim surround
  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = dofile(path..'nvim-surround.lua')
  })

  -- img viewer
  use 'nvim-telescope/telescope-media-files.nvim'

  -- comments
  use({
    'numToStr/Comment.nvim',
    config = dofile(path..'comment.lua')
  })

  use {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = dofile(path..'ufo.lua')
  }

  -- tree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = dofile(path..'nvim-tree.lua')
  })

  -- bufferline
  use({
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = dofile(path..'bufferline.lua')
  })

  -- buffer mgmt
  use 'moll/vim-bbye'

  -- toggle term
  use({
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = dofile(path..'toggleterm.lua')
  })

  -- colorizer
  use({
    'NvChad/nvim-colorizer.lua',
    config = dofile(path..'nvm-colorizer.lua')
  })

  -- registers 
  use({
    "tversteeg/registers.nvim",
    config = dofile(path..'registers.lua')
  })

  -- icon/emoji picker
  use 'stevearc/dressing.nvim'

  use({
    "ziontee113/icon-picker.nvim",
    config = dofile(path..'icon-picker.lua')
  })

  -- discord presence
  --[[ use({
    'andweeb/presence.nvim',
    config = dofile(path..'presence.lua')
  }) ]]

  -- img previews
  use({
    'adelarsq/image_preview.nvim',
    config = dofile(path..'image-preview.lua')
  })

  -- matchup words
  use({
    'andymass/vim-matchup',
    config = dofile(path..'matchup.lua')
  })
end)
