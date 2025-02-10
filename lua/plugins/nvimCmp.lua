return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- LSP completion source
    "hrsh7th/cmp-nvim-lsp",
    -- Snippet completion source
    "saadparwaiz1/cmp_luasnip",
    -- Buffer completion source
    "hrsh7th/cmp-buffer",
    -- Path completion source
    "hrsh7th/cmp-path",
    -- Snippet engine
    "L3MON4D3/LuaSnip",
    -- Friendly snippets (optional, pre-built snippets)
    "rafamadriz/friendly-snippets",
  },
  config = function()
    -- Setup nvim-cmp.
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item.
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "buffer" },
        { name = "path" },
      },
    }
  end,
}
