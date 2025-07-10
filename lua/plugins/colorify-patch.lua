-- Patch for NvChad colorify plugin LSP buffer number bug
return {
  {
    "NvChad/ui",
    priority = 1000,
    config = function()
      -- Create an autocmd to patch colorify before it causes issues
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Override the problematic colorify function
          local ok, colorify = pcall(require, "nvchad.colorify.methods")
          if ok and colorify then
            local original_lsp_var = colorify.lsp_var
            if original_lsp_var then
              colorify.lsp_var = function(client, bufnr, ...)
                -- Ensure bufnr is a number, not a function
                if type(bufnr) == "function" then
                  bufnr = vim.api.nvim_get_current_buf()
                elseif type(bufnr) ~= "number" then
                  bufnr = vim.api.nvim_get_current_buf()
                end
                
                -- Call original function with corrected bufnr
                return original_lsp_var(client, bufnr, ...)
              end
            end
          end
        end,
      })
      
      -- Also try to patch it immediately
      vim.schedule(function()
        local ok, colorify = pcall(require, "nvchad.colorify.methods")
        if ok and colorify and colorify.lsp_var then
          local original_lsp_var = colorify.lsp_var
          colorify.lsp_var = function(client, bufnr, ...)
            -- Ensure bufnr is a number, not a function
            if type(bufnr) == "function" then
              bufnr = vim.api.nvim_get_current_buf()
            elseif type(bufnr) ~= "number" then
              bufnr = vim.api.nvim_get_current_buf()
            end
            
            -- Call original function with corrected bufnr
            return original_lsp_var(client, bufnr, ...)
          end
        end
      end)
    end,
  },
}
