-- -- EXAMPLE 
-- local on_attach = require("nvchad.configs.lspconfig").on_attach
-- local on_init = require("nvchad.configs.lspconfig").on_init
-- local capabilities = require("nvchad.configs.lspconfig").capabilities
--
-- local lspconfig = require "lspconfig"
-- local servers = { "html", "cssls", "tailwindcss", "stimulus_ls", "docker_compose_language_service", "dockerls", "arduino_language_server", "clangd", "terraformls", "ruby_lsp" }
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--   }
-- end
--
-- -- typescript
-- -- lspconfig.tsserver.setup {
-- --   on_attach = on_attach,
-- --   on_init = on_init,
-- --   capabilities = capabilities,
-- -- }
-- lspconfig.ruby_lsp.setup {
--   mason = false,
--   cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
-- }

local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

local servers = { "html", "cssls", "tailwindcss", "stimulus_ls", "docker_compose_language_service", "dockerls", "arduino_language_server", "clangd", "terraformls", "ruby_lsp", "html" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
