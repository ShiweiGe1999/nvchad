local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "eslint", "ts_ls", "lua_ls", "tailwindcss" }

-- Custom on_attach function
local custom_on_attach = function(client, bufnr)
  -- Call NvChad's default on_attach
  nvlsp.on_attach(client, bufnr)

  -- Helper function to set key mappings
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Telescope LSP key mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>Telescope lsp_document_symbols<CR>', opts)
  buf_set_keymap('n', 'gS', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>Telescope lsp_diagostics<CR>', opts)
  -- Add more mappings as needed
end

-- Load NvChad's default configurations
nvlsp.defaults()

-- Set up LSP servers with the custom on_attach
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,  -- Use custom on_attach
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
