local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "gitignore",
    "html",
    "ini",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rust",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  git = {
    enable = true,
    ignore = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "codeium" },
    { name = "nvim_lua" },
  },
  experimental = {
    ghost_text = true,
  },
}

return M
