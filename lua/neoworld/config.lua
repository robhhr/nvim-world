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
    lazy = false,
    priority = 1000,
    config = function()
      require("neoworld.plugins.gruvbox")
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
      require("neoworld.plugins.treesitter")
    end,
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("neoworld.plugins.oil")
    end,
    lazy = false,
  },

  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = function()
      require("neoworld.plugins.oil-git")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end,                desc = "Telescope: Find Files" },
      { "<leader>gg", function() require("telescope.builtin").git_files() end,                 desc = "Telescope: Git Files" },
      { "<leader>ll", function() require("telescope.builtin").live_grep() end,                 desc = "Telescope: Live Grep" },
      { "<leader>b",  function() require("telescope.builtin").buffers() end,                   desc = "Telescope: Buffers" },
      { "<leader>/",  function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Telescope: Fuzzy Find" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neoworld.plugins.telescope")
    end,
  },

  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Harpoon add file" },
      { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon quick menu" },
    },
    config = function()
      require("neoworld.plugins.harpoon")
    end,
  },

  {
    "smoka7/hop.nvim",
    version = "*",
    cmd = { "HopWord" },
    keys = {
      { "<leader>h", "<cmd>HopWord<CR>", desc = "Hop to Word" },
    },
    opts = { keys = "etovxqpdygfblzhckisuran" },
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy",
    keys = {
      { "<tab>",   function() return require("fold-cycle").open() end,  desc = "Fold-cycle open",  silent = true },
      { "<s-tab>", function() return require("fold-cycle").close() end, desc = "Fold-cycle close", silent = true },
    },
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
    },
  },

  { "kylechui/nvim-surround",   version = "*",         event = "VeryLazy", opts = {} },

  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccConvert", "CccHighlighterDisable", "CccHighlighterEnable", "CccHighlighterToggle", "CccPick" },
    opts = {},
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<CR>", desc = "Trouble diagnostics" },
    },
    opts = {},
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("neoworld.plugins.lualine")
    end,
  },

  -- git related
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"
    },
    keys = {
      { "<leader>z", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "windwp/nvim-autopairs",    event = "InsertEnter", config = true,      opts = {} },

  -- misc
  { "numToStr/Comment.nvim",    opts = {} },
  { "jghauser/fold-cycle.nvim", opts = {} },

  -- lsp
  {
    "williamboman/mason.nvim",
    config = function()
      require("neoworld.plugins.lsp")
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "stevearc/conform.nvim",
    config = function()
      require("neoworld.plugins.conform-nvim")
    end
  },

  -- copilot
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    init = function()
      vim.g.copilot_enabled = 0
    end,
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
  },
})
