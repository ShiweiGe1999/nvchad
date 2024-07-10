local M = {}
local conform = require("conform")
function M.format_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  conform.format({
    range = {
      start = start_pos[2],
      ["end"] = end_pos[2],
    },
  })
end

return M
