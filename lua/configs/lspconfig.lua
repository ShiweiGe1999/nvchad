-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "eslint", "tailwindcss", 'pylsp', 'golangci_lint_ls', 'gopls'}
vim.lsp.enable(servers)
