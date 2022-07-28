require('packer').startup(function(use)
	-- setting them with spaces in between to later categorize them
	use 'wbthomason/packer.nvim'

	use 'ellisonleao/gruvbox.nvim'

	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }) 

	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

	use {'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons'}

use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
}

use 'windwp/nvim-ts-autotag'

use 'p00f/nvim-ts-rainbow'

use 'windwp/nvim-autopairs'

use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}

use 'neovim/nvim-lspconfig'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'hrsh7th/nvim-cmp'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

use 'norcalli/nvim-colorizer.lua'

use 'lewis6991/gitsigns.nvim'

use 'glepnir/dashboard-nvim'

use "lukas-reineke/indent-blankline.nvim"
end)
