-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	use({
		'yazeed1s/oh-lucy.nvim',
		as = 'oh-lucy',
		config = function()
			vim.cmd('colorscheme oh-lucy-evening')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use 'nvim-treesitter/playground'

	use 'theprimeagen/harpoon'

	use 'mbbill/undotree'

	use 'tpope/vim-fugitive'
end)


