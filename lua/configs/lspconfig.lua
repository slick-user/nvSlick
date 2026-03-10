-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local navic = require "nvim-navic"

local function on_attach(client, bufnr)
  nvlsp.on_attach(client, bufnr)

  -- attach breadcrumbs
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local capabilities = nvlsp.capabilities

local servers = { "cssls", "clangd", "ast_grep", "html", "ts_ls", "pyright", "gopls", "asm_lsp"}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(server)
end
