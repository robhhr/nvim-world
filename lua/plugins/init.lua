require('packer').startup(function(use)
	-- setting them with spaces in between to later categorize them
	use 'wbthomason/packer.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) 
end)
