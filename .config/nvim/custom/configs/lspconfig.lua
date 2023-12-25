local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "pyright", "html", "cssls", "jsonls", "tailwindcss" }

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

require("typescript-tools").setup {
  on_attach = custom_on_attach,

  settings = {
    tsserver_path = "/home/ihsaan/.nvm/versions/node/v20.10.0/lib/node_modules/typescript/lib/tsserver.js",
    tsserver_file_preferences = {
      includeInlayEnumMemberValueHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true
    },
  },
}
