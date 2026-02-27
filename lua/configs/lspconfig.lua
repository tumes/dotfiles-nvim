require("nvchad.configs.lspconfig").defaults()

local servers = { "ruby_lsp", "html", "cssls", "tailwindcss", "stimulus_ls", "docker_compose_language_service", "dockerls", "arduino_language_server", "clangd", "terraformls", "astro", "ts_ls", "rust_analyzer", "jsonls" }
vim.lsp.enable(servers)
