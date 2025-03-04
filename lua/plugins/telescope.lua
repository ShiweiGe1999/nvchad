return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
  },
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
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    }
    require("telescope").load_extension "ui-select"
  end,
}
