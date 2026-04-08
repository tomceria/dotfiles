-- LSP server setup
-- Install servers with :MasonInstall <name>
-- Common servers: html-lsp, css-lsp, typescript-language-server, json-lsp
local configs = require "nvchad.configs.lspconfig"

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "jsonls",
}

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach    = configs.on_attach,
    on_init      = configs.on_init,
    capabilities = configs.capabilities,
  }
end
