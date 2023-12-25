local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "pyright", "html", "cssls", "jsonls", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("typescript-tools").setup {
  settings = {
    tsserver_path = "/home/ihsaan/.nvm/versions/node/v20.10.0/lib/node_modules/typescript/lib/tsserver.js",
  },
}
