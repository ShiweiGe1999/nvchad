vim.g.mapleader = " "

-- Check if running inside VSCode
if vim.g.vscode then
  -- VSCode-specific configuration
  -- Load hop.nvim for VSCode integration
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup {
    {
      "phaazon/hop.nvim",
      branch = "v2",
      config = function()
        require("hop").setup {
          keys = "etovxqpdygfblzhckisuran",
          case_insensitive = true,
        }
      end,
    },
  }

  require("vscode-init").setup()
else
  -- Regular Neovim configuration
  vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

  -- bootstrap lazy and all plugins
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  local lazy_config = require "configs.lazy"

  -- load plugins
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
    },

    { import = "plugins" },
  }, lazy_config)

  -- load theme
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")

  require "options"
  require "nvchad.autocmds"

  vim.schedule(function()
    require "mappings"
    vim.env.BEDROCK_KEYS = os.getenv "BEDROCK_KEYS"
  end)
end
