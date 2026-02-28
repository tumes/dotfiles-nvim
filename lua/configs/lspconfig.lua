require("nvchad.configs.lspconfig").defaults()

local ruby_bin = vim.fn.expand("~/.local/share/mise/installs/ruby/3.4.4/bin")
vim.lsp.config("solargraph", {
  cmd_env = {
    BUNDLE_GEMFILE = "",
    GEM_PATH = ruby_bin .. "/../lib/ruby/gems/3.4.0",
  },
  cmd = { ruby_bin .. "/ruby", ruby_bin .. "/solargraph", "stdio" },
  settings = {
    solargraph = {
      useBundler = false,
    },
  },
})

local servers = { "ruby_lsp", "solargraph", "html", "cssls", "tailwindcss", "stimulus_ls", "docker_compose_language_service", "dockerls", "arduino_language_server", "clangd", "terraformls", "astro", "ts_ls", "rust_analyzer", "jsonls" }
vim.lsp.enable(servers)
