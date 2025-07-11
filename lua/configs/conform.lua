local options = {
  formatters_by_ft = {
    lua = { "lua-language-server" },
    css = { "prettier" },
    html = { "prettier" },

    javascript = { "eslint_d, prettier" },
    typescript = { "eslint_d, prettier" },
    javascriptreact = { "eslint_d, prettier" },
    typescriptreact = { "eslint_d, prettier" },
    go = { "gofumpt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
