return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local actions = require "telescope.actions"
    require("telescope").setup {
      defaults = {
        layout_config = {
          prompt_position = "top", -- Set the search input at the top
        },
        sorting_strategy = "ascending", -- Ensure results are ordered from top to bottom
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--ignore-case" }
          end,
        },
      },
    }
    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>gc", "<cmd>Telescope git commits<cr>", { desc = "Find todos" })
  end,
}
