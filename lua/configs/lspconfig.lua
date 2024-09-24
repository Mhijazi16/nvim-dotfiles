-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "omnisharp", "pyright", "rubocop"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

require'lspconfig'.ruby_lsp.setup{
  cmd = { "ruby-lsp" },  -- Ensure this matches your Ruby LSP command
  filetypes = { "ruby" },
  root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git"),
  settings = {
    -- Add any Ruby-specific settings here
  }
}

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

