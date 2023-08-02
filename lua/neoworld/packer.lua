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

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  --[[ 🎨 start of themes 🎨 ]]
  -- use({
  --   'yazeed1s/oh-lucy.nvim',
  --   as = 'oh-lucy',
  --   config = function()
  --     vim.cmd('colorscheme oh-lucy-evening')
  --   end
  -- })

  --[[ use({
    'savq/melange-nvim',
  }) ]]
  --

  -- use { 'ray-x/starry.nvim', setup = function()
  --   vim.g.starry_italic_comments = true
  --   vim.g.starry_deep_black = true
  --   vim.g.starry_daylight_switch = true
  -- end }

  use { 'nyoom-engineering/oxocarbon.nvim' }

  -- light colorschemes
  use { "ellisonleao/gruvbox.nvim" }
  use { 'foxbunny/vim-amber' }
  use { 'machakann/vim-colorscheme-kemonofriends' }

  --[[ 🎨 end of themes 🎨 ]]
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use 'nvim-treesitter/playground'

  use 'theprimeagen/harpoon'

  use 'mbbill/undotree'

  use 'tpope/vim-fugitive'

  use {
    'vonheikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'l3mOn4d3/luasnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
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

  use 'axieax/urlview.nvim'

  use({
    'kylechui/nvim-surround',
    tag = "*",
    config = function()
      require('nvim-surround').setup({})
    end
  })

  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  use { 'lewis6991/gitsigns.nvim' }

  use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' }

  use({
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        mappings = {
          '<C-u>',
          '<C-d>',
          '<C-b>',
          '<C-f>',
          '<C-y>',
          'zt',
          'zz',
          'zb'
        },
      })
    end
  })

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
  }

  use 'windwp/nvim-ts-autotag'

  use 'sbdchd/neoformat'

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  use 'nvim-telescope/telescope-symbols.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
