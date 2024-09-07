local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- only required if you have packer configured as 'opt'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use 'nvim-lua/popup.nvim'

  use 'nvim-telescope/telescope-media-files.nvim'

  --[[ 🎨 themes 🎨 ]]
  use 'Biscuit-Colorscheme/nvim'

  use 'projekt0n/github-nvim-theme'

  use 'ellisonleao/gruvbox.nvim'

  use 'Shatur/neovim-ayu'

  use { 'askfiy/visual_studio_code',
    config = function()
      require("visual_studio_code").setup {}
    end
  }
  --[[ 🎨 themes 🎨 ]]

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use 'nvim-treesitter/playground'

  use 'theprimeagen/harpoon'

  use 'tpope/vim-fugitive'

  --[[ 🌻 lsp 🌻 ]]
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' })
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'
  --[[ 🌻 lsp 🌻 ]]

  use 'github/copilot.vim'

  use 'AndrewRadev/discotheque.vim'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    'jghauser/fold-cycle.nvim',
    config = function()
      require('fold-cycle').setup()
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'nvchad/nvim-colorizer.lua'

  use 'uga-rosa/ccc.nvim'

  use {
    'numtostr/comment.nvim',
    config = function() require('comment').setup() end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  use({
    'kylechui/nvim-surround',
    tag = "*",
    config = function()
      require('nvim-surround').setup({})
    end
  })

  use({
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup({
        close_fold_kinds_for_ft = {
          default = { 'imports', 'comment' },
          json = { 'array' },
          c = { 'comment', 'region' }
        },
      })
    end,
  })

  use { 'lewis6991/gitsigns.nvim' }

  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  })

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }

  use 'windwp/nvim-ts-autotag'

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  use 'nvim-telescope/telescope-symbols.nvim'

  use 'folke/twilight.nvim'

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use { 'echasnovski/mini.cursorword', config = function()
    require('mini.cursorword').setup()
  end }

  use { 'echasnovski/mini.indentscope', config = function()
    require('mini.indentscope').setup()
  end }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
