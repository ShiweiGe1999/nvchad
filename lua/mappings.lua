require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>Y", '"+Y')
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')
map({ "n", "i", "v" }, "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

map("n", "]t", ":tabnext<CR>")
map("n", "[t", ":tabprevious<CR>")
map("x", "<leader>fs", ":sort<CR>")
map("", "<leader>fm", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "[F]ormat" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
