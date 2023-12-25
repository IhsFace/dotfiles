local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "pmizio/typescript-tools.nvim",
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter
  },
}
return plugins
