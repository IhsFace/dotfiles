local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "pyright", "html", "cssls", "jsonls", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("typescript-tools").setup {
  on_attach = on_attach,

  settings = {
    tsserver_path = "/home/ihsaan/.nvm/versions/node/v20.10.0/lib/node_modules/typescript/lib/tsserver.js",
  },
}
