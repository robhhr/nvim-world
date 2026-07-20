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
      vim.o.background = require("neoworld.utils.theme").read_mode()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
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
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neoworld.plugins.harpoon")
    end,
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end,  desc = "Harpoon add file" },
      {
        "<C-e>",
        function()
          local h = require("harpoon")
          h.ui:toggle_quick_menu(h:list())
        end,
        desc = "Harpoon quick menu"
      },
      { "<C-j>",     function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
      { "<C-l>",     function() require("harpoon"):list():next() end, desc = "Harpoon next" },
    },
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
    opts = {
      warn_no_results = false,
      open_no_results = true,
    },
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

  -- linting (phpcs via project-local ruleset)
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      require("neoworld.plugins.nvim-lint")
    end,
  },

  -- debugging (DAP) — language-agnostic core; add a language adapter per dependency
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",           -- required by dap-ui
      "theHamsta/nvim-dap-virtual-text", -- inline variable values
      "leoluz/nvim-dap-go",              -- language adapter: Go (delve)
    },
    config = function()
      require("neoworld.plugins.dap")
    end,
    keys = {
      -- VSCode-matched function keys (so course instructions translate 1:1)
      { "<F5>",       function() require("dap").continue() end,                                  desc = "Debug: start/continue" },
      { "<F9>",       function() require("dap").toggle_breakpoint() end,                         desc = "Debug: toggle breakpoint" },
      { "<F10>",      function() require("dap").step_over() end,                                 desc = "Debug: step over" },
      { "<F11>",      function() require("dap").step_into() end,                                 desc = "Debug: step into" },
      { "<F23>",      function() require("dap").step_out() end,                                  desc = "Debug: step out" }, -- <S-F11>
      -- leader fallbacks (terminals are inconsistent with shifted F-keys)
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                         desc = "Debug: breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Debug: conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                  desc = "Debug: continue" },
      { "<leader>do", function() require("dap").step_out() end,                                  desc = "Debug: step out" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                               desc = "Debug: REPL" },
      { "<leader>dl", function() require("dap").run_last() end,                                  desc = "Debug: run last" },
      { "<leader>du", function() require("dapui").toggle() end,                                  desc = "Debug: toggle UI" },
      { "<leader>dt", function() require("dap-go").debug_test() end,                             desc = "Debug: nearest Go test" },
    },
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
