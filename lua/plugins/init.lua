return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
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
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  -- { "catlee/pull_diags.nvim", event = "LspAttach", opts = {} },
  --
  {
    "williamboman/mason.nvim",
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
      },
    },
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
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        -- api_key_cmd = "op read op://pfq2sghne45z45g7au5klua5q4/OpenAI/credential --no-newline",
        api_key_cmd = "cat " .. os.getenv "HOME" .. "/openaikey.txt",

        openai_params = {
          model = "gpt-4o",
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
  },
}
