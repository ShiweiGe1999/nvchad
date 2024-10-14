require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

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
map("t", "<C-w>", [[<C-\><C-n><C-w>]])
