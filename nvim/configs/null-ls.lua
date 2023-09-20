local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.black,
  formatting.clang_format,

  lint.eslint,
  lint.pylint,
  lint.cppcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
