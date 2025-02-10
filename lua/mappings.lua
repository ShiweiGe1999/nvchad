require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gr", "<cmd>Telescope lsp_references<CR>")
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>")
map("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>")
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>")
map("n", "gh", '<cmd>lua require("telescope.builtin").diagnostics()<CR>')
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>Y", '"+Y')
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')
map({ "n", "v" }, "<leader>ft", ":ToggleTerm<CR>", { noremap = true, silent = true })

map("n", "]t", ":tabnext<CR>")
map("n", "[t", ":tabprevious<CR>")
map("x", "<leader>fs", ":sort<CR>")
map("", "<leader>fm", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "[F]ormat" })
map("t", "<esc>", [[<C-\><C-n>]])
map("t", "jk", [[<C-\><C-n>]])
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
map("n", "<leader>cb", ":%bd|e#|bd#<CR>", { desc = "close all buffers except for the current one"})
