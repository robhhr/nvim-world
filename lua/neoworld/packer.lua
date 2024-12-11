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

    use 'nvim-lua/popup.nvim'

    use 'nvim-telescope/telescope-media-files.nvim'

    use 'nvim-treesitter/playground'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    use { 'lewis6991/gitsigns.nvim' }

    use 'windwp/nvim-ts-autotag'

    use 'nvim-telescope/telescope-symbols.nvim'

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
