local options = {
  formatters_by_ft = {
    ["*"] = { "prettier"},
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "eslint_d, prettier" },
    typescript = { "eslint_d, prettier" },
    javascriptreact = { "eslint_d, prettier" },
    typescriptreact = { "eslint_d, prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
