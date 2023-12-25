local options = {
  formatters_by_ft = {
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    python = { "ruff_format, ruff_fix" },
  },
}

require("conform").setup(options)
