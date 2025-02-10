return {
  "phaazon/hop.nvim",
  as = "hop",
  keys = { "s", "S" },
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", {})
    vim.api.nvim_set_keymap("n", "S", ":HopPattern<cr>", {})
  end,
}
