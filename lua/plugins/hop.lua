return {
  "phaazon/hop.nvim",
  branch = "v2", -- recommended
  event = "VeryLazy",
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran",
      case_insensitive = true,
    })
  end,
  -- stylua: ignore
  keys = {
    -- These will be used in regular Neovim mode
    { "<leader>hw", function() require("hop").hint_words() end, desc = "Hop words" },
    { "<leader>hl", function() require("hop").hint_lines() end, desc = "Hop lines" },
    { "<leader>hc", function() require("hop").hint_char1() end, desc = "Hop to char" },
    { "<leader>hp", function() require("hop").hint_patterns() end, desc = "Hop patterns" },
  },
}