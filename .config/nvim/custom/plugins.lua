local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,

    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)

          local luasnip = require "luasnip"
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          require("luasnip/loaders/from_vscode").lazy_load()
        end,
      },
      {
        "jcdickinson/codeium.nvim",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
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
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
}
return plugins
