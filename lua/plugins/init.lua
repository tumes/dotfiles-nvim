return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  "nvzone/volt", -- optional, needed for theme switcher
  {
    "tpope/vim-fugitive",
    cmd = { "G" },
  },
  {
    "tpope/vim-rails",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    event = "InsertEnter",
    -- lazy = false,
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  --
  -- { "catlee/pull_diags.nvim", event = "LspAttach", opts = {} },
  --
  {
    "williamboman/mason.nvim",
    -- opts = {
    --   ensure_installed = {
    --     "lua-language-server",
    --     "stylua",
    --     "html-lsp",
    --     "css-lsp",
    --     "prettier",
    --     "solargraph",
    --     "docker-compose-language-service",
    --     "dockerfile-language-server",
    --     "stimulus-language-server",
    --     "tailwindcss-language-server",
    --     "astro-language-server",
    --     "typescript-language-server",
    --   },
    -- },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "solargraph",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "stimulus-language-server",
        "tailwindcss-language-server",
        "astro-language-server",
        "typescript-language-server",
        "rust-analyzer",
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "jamestthompson3/nvim-remote-containers",
    lazy = false,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup {
  --       -- api_key_cmd = "op read op://pfq2sghne45z45g7au5klua5q4/OpenAI/credential --no-newline",
  --       api_key_cmd = "cat " .. os.getenv "HOME" .. "/openaikey.txt",
  --
  --       openai_params = {
  --         model = "gpt-4o",
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  -- {
  --   "joshuavial/aider.nvim",
  --   lazy = false,
  --   opts = {
  --     debug = true,
  --   }
  -- },
  -- {
  --   "GeorgesAlkhouri/nvim-aider",
  --   cmd = {
  --     "AiderTerminalToggle", "AiderHealth",
  --   },
  --   keys = {
  --     { "<leader>a/", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
  --     { "<leader>as", "<cmd>AiderTerminalSend<cr>", desc = "Send to Aider", mode = { "n", "v" } },
  --     { "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
  --     { "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
  --     { "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
  --     { "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
  --     { "<leader>ar", "<cmd>AiderQuickReadOnlyFile<cr>", desc = "Add File as Read-Only" },
  --     -- Example nvim-tree.lua integration if needed
  --     -- { "<leader>a+", "<cmd>AiderTreeAddFile<cr>", desc = "Add File from Tree to Aider", ft = "NvimTree" },
  --     -- { "<leader>a-", "<cmd>AiderTreeDropFile<cr>", desc = "Drop File from Tree from Aider", ft = "NvimTree" },
  --   },
  --   dependencies = {
  --     "folke/snacks.nvim",
  --     --- The below dependencies are optional
  --     "catppuccin/nvim",
  --     -- "nvim-tree/nvim-tree.lua",
  --     --- Neo-tree integration
  --     -- {
  --     --   "nvim-neo-tree/neo-tree.nvim",
  --     --   opts = function(_, opts)
  --     --     -- Example mapping configuration (already set by default)
  --     --     -- opts.window = {
  --     --     --   mappings = {
  --     --     --     ["+"] = { "nvim_aider_add", desc = "add to aider" },
  --     --     --     ["-"] = { "nvim_aider_drop", desc = "drop from aider" }
  --     --     --   }
  --     --     -- }
  --     --     require("nvim_aider.neo_tree").setup(opts)
  --     --   end,
  --     -- },
  --   },
  --   config = true,
  -- },
  -- { import = "nvchad.blink.lazyspec" }
}
