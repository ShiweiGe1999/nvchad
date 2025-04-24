-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "eslint", "tailwindcss", 'pylsp', 'golangci_lint_ls', 'gopls'}
local nvlsp = require "nvchad.configs.lspconfig"

local ooo = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  -- map HERE
  vim.keymap.set("n", "gd", "<cmd> Telescope<cr>", { buffer = bufnr })
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { buffer = bufnr })
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>fr", '<cmd>Telescope resume<CR>', { buffer = bufnr })
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = ooo,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
