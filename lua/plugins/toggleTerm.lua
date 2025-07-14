return {
  "akinsho/toggleterm.nvim",
  version = "*", -- This ensures you always get the latest version
  config = function()
    require("toggleterm").setup {
      size = 60,
      open_mapping = [[<F7>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "vertical",
      close_on_exit = true,
      shell = vim.o.shell,
    }
  end,
  -- Optional lazy-loading conditions:
  lazy = true, -- Makes the plugin load lazily
  keys = "<F7>", -- Load the plugin when <F7> is pressed
  cmd = "ToggleTerm", -- Load the plugin when the ToggleTerm command is used
}
