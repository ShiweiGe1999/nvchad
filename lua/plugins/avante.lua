local function set_aws_credentials()
  -- Check if BEDROCK_KEYS is already defined by the user (e.g., in .zshrc)
  local existing_keys = vim.fn.getenv("BEDROCK_KEYS")
  if existing_keys and existing_keys ~= "" and existing_keys ~= vim.NIL then
    vim.notify(string.format("Using existing BEDROCK_KEYS from environment"), vim.log.levels.INFO)
    return nil
  end

  -- Try to get new credentials
  local handle = io.popen("ada credentials print --profile=mcp 2>/dev/null")
  if not handle then
    vim.notify("Failed to execute ada credentials command", vim.log.levels.WARN)
    return nil
  end
  local result = handle:read("*a")
  local exit_code = handle:close()
  -- Check if command executed successfully
  if not exit_code then
    vim.notify("ada credentials command failed", vim.log.levels.WARN)
    return nil
  end

  -- Try to parse the JSON
  local ok, creds = pcall(vim.json.decode, result)
  if not ok or not creds or not creds.AccessKeyId or not creds.SecretAccessKey then
    vim.notify("Failed to parse credentials from ada", vim.log.levels.WARN)
    return nil
  end

  -- Create the credentials string
  local bedrock_keys = string.format("%s,%s,%s",
    creds.AccessKeyId,
    creds.SecretAccessKey,
    "us-west-2" -- aws_region
  )
  -- Add session token if present
  if creds.SessionToken then
    bedrock_keys = bedrock_keys .. "," .. creds.SessionToken
  end

  -- Export the BEDROCK_KEYS environment variable
  vim.fn.setenv("BEDROCK_KEYS", bedrock_keys)

  -- Create a marker file to indicate we've set the credentials
  local marker_file = vim.fn.stdpath("cache") .. "/bedrock_keys_set_by_nvim"
  local marker_handle = io.open(marker_file, "w")
  if marker_handle then
    marker_handle:write("1")
    marker_handle:close()
  end

  vim.notify("AWS credentials updated successfully", vim.log.levels.INFO)
  return nil
end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = function()
    set_aws_credentials()
    return {
      provider = "bedrock_sonnet",
      behaviour = {
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
      },
      providers = {
        bedrock_sonnet = {
          __inherited_from = "bedrock",
          model = "us.anthropic.claude-sonnet-4-20250514-v1:0",
          -- model = "us.anthropic.claude-3-7-sonnet-20250219-v1:0",
          extra_request_body = {
            max_tokens = 8192,
            temperature = 0.1,
            top_p = 0.9,
          }
        },
      },
      windows = {
        width = 40,
        input = {
          height = 12
        }
      }
    }
  end,
  disabled_tools = { "python", "web_search", "rag_search" },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    -- {
    --   -- support for image pasting
    --   "HakonHarnes/img-clip.nvim",
    --   event = "VeryLazy",
    --   opts = {
    --     -- recommended settings
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --       -- required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
