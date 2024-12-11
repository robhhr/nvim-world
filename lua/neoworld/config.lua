local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("neoworld.plugins.gruvbox")
            vim.cmd([[colorscheme gruvbox]])
        end,
        opts = ...
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("neoworld.plugins.treesitter")
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("neoworld.plugins.telescope")
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- {
    --     "goolord/alpha-nvim",
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --         require("neoworld.plugins.alpha-nvim")
    --     end,
    -- },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require("neoworld.plugins.dashboard-nvim")
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },

    {
        "Exafunction/codeium.vim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("neoworld.plugins.codeium")
        end,
    },

    {
        'ThePrimeagen/harpoon',
        config = function()
            require("neoworld.plugins.harpoon")
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("neoworld.plugins.nvim-tree")
        end,
    },

    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        },
        lazy = true,
        cmd = {
            "HopWord",
        },
    },

    {
        "folke/twilight.nvim",
        lazy = true,
        cmd = {
            "Twilight",
            "TwilightEnable",
            "TwilightDisable",
        },
        opts = {},
    },

    {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("neoworld.plugins.todo-comments")
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "VeryLazy",
        init = function()
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
        opts = {
            close_fold_kinds_for_ft = {
                default = { 'imports', 'comment' },
                json = { 'array' },
                c = { 'comment', 'region' }
            },
        }
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {}
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "uga-rosa/ccc.nvim",
        opts = {},
        lazy = true,
        cmd = {
            "CccConvert",
            "CccHighlighterDisable",
            "CccHighlighterEnable",
            "CccHighlighterToggle",
            "CccPick"
        }
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        lazy = true,
        cmd = {
            "ToggleTerm",
        },
        opts = {
            size = 10,
            open_mapping = [[<c-z>]],
            direction = 'horizontal',
        },
        keys = {
            { "<C-z>", ":ToggleTerm<CR>", desc = "ToggleTerm" },
        },
    },

    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle focus=true<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },

    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        config = function()
            require("neoworld.plugins.codecompanion")
        end,
        cmd = {
            "CodeCompanion",
            "CodeCompanionActions",
            "CodeCompanionChat",
            "CodeCompanionCmd",
        },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("neoworld.plugins.lualine")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = {
            current_line_blame = true,
        }
    },

    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {}
    },

    { 'echasnovski/mini.cursorword', version = '*', opts = {} },
    { 'numtostr/comment.nvim',       opts = {} },
    { 'jghauser/fold-cycle.nvim',    opts = {} },
    { "nvchad/nvim-colorizer.lua",   opts = {} },

    -- lsp
    {
        "williamboman/mason.nvim",
        config = function()
            require("neoworld.plugins.lsp")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
    -- lsp

    -- cmp
    {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
    },
    -- cmp
})
