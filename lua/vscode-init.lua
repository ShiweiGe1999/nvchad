-- VSCode Neovim Integration
local M = {}

-- Detect if running inside VSCode
M.is_vscode = function()
    return vim.g.vscode ~= nil
end

-- Initialize VSCode-specific settings
M.setup = function()
    if not M.is_vscode() then
        return
    end

    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    -- VSCode-specific options
    vim.opt.clipboard = "unnamedplus" -- Use system clipboard (from your config)
    -- Keep some basic settings
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.incsearch = true
    vim.opt.hlsearch = true

    -- VSCode-specific keymappings based on your existing preferences
    local map = vim.keymap.set

    map("n", "<Space>", "", opts)
    -- Your existing basic mappings
    map("n", ";", ":", {
        desc = "CMD enter command mode"
    })
    -- Fix jk to properly escape in VSCode
    map("i", "jk", "<cmd>call VSCodeNotify('vscode-neovim.escape')<CR>", {
        desc = "Exit insert mode",
        silent = true
    })

    -- Your existing clipboard operations
    map({"n", "v"}, "<leader>y", '"+y')
    map({"n", "v"}, "<leader>Y", '"+Y')
    map({"n", "v"}, "<leader>p", '"+p')
    map({"n", "v"}, "<leader>P", '"+P')

    -- Terminal toggle (matching your <leader>ft for ToggleTerm)
    map({"n", "v"}, "<leader>t", "<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>", {
        noremap = true,
        silent = true
    })

    -- Editor navigation (Tab and Shift+Tab)
    map("n", "<Tab>", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", {
        desc = "Next editor"
    })
    map("n", "<S-Tab>", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>", {
        desc = "Previous editor"
    })

    -- Format (matching your <leader>fm)
    map("", "<leader>fm", "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", {
        desc = "[F]ormat"
    })

    -- Close all buffers except current (matching your <leader>cb)
    map("n", "<leader>cb", "<cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>", {
        desc = "close all buffers except for the current one"
    })

    -- Search/Find (matching your <leader>fr for telescope resume)
    map("n", "<leader>fr", "<cmd>call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditor')<CR>", {
        desc = "Resume recent"
    })

    -- Diagnostics (matching your <leader>db and <leader>dw)
    map({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")

    -- LSP actions (matching your <leader>ca and <leader>sh)
    map("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>", {
        desc = "Show code actions",
        silent = true
    })
    map({"n", "v"}, "<leader>sh", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")

    -- Additional LSP features
    map("n", "gd", "<cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", {
        desc = "Go to definition"
    })
    map("n", "gr", "<cmd>call VSCodeNotify('editor.action.goToReferences')<CR>", {
        desc = "Go to references"
    })
    map("n", "gi", "<cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", {
        desc = "Go to implementation"
    })
    map("n", "gy", "<cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>", {
        desc = "Go to type definition"
    })
    map("n", "<leader>rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>", {
        desc = "Rename symbol"
    })

    -- Explorer and view management
    map("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.view.explorer')<CR>", {
        desc = "Toggle explorer"
    })
    map("n", "<leader>ff", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", {
        desc = "Find files"
    })
    -- Modified to better support Neovim navigation when searching
    map("n", "<leader>fb", "<cmd>call VSCodeNotify('workbench.action.showAllEditorsByMostRecentlyUsed')<CR>", {
        desc = "Find buffers"
    })
    map("n", "<leader>fc", "<cmd>call VSCodeNotify('actions.find')<CR>", {
        desc = "Find in current file"
    })
    map("n", "<leader>fa", "<cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>", {
        desc = "Find and replace in current file"
    })
    map("n", "<leader>fg", "<cmd>call VSCodeNotify('workbench.action.focusSearch')<CR>", {
        desc = "Navigate to global search results"
    })

    -- Sort (matching your <leader>fs)
    map("x", "<leader>fs", "<cmd>call VSCodeNotify('editor.action.sortLinesAscending')<CR>", {
        desc = "Sort lines"
    })

    -- Hop.nvim integration
    map({"n", "x", "o"}, "s", "<cmd>lua require('hop').hint_words()<CR>", {
        desc = "Hop words"
    })

    -- Treesitter integration
    map({"n", "x", "o"}, "S", "<cmd>call VSCodeNotify('editor.action.selectToBracket')<CR>", {
        desc = "Treesitter-like selection"
    })

    -- Window management (additional)
    map("n", "<leader>wv", "<cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>", {
        desc = "Split vertically"
    })
    map("n", "<leader>wh", "<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>", {
        desc = "Split horizontally"
    })
    map("n", "<leader>wc", "<cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>", {
        desc = "Close editor group"
    })

    -- Panel navigation
    map({"n", "t", "v"}, "<C-l>", "<cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>", {
        desc = "Navigate to right panel"
    })
    map({"n", "t", "v"}, "<C-h>", "<cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>", {
        desc = "Navigate to left panel"
    })
    map({"n", "t", "v"}, "<C-j>", "<cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>", {
        desc = "Navigate to panel below"
    })
    map({"n", "t", "v"}, "<C-k>", "<cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>", {
        desc = "Navigate to panel above"
    })

    -- Additional navigation
    map("n", "<C-o>", "<cmd>call VSCodeNotify('workbench.action.navigateBack')<CR>", {
        desc = "Navigate back"
    })
    map("n", "<C-i>", "<cmd>call VSCodeNotify('workbench.action.navigateForward')<CR>", {
        desc = "Navigate forward"
    })

    -- Additional LSP features
    map("n", "<leader>fs", "<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>", {
        desc = "Document symbols"
    })
    map("n", "<leader>fi", "<cmd>call VSCodeNotify('editor.action.showIncomingCalls')<CR>", {
        desc = "Incoming calls"
    })
    map("n", "<leader>fo", "<cmd>call VSCodeNotify('editor.action.showOutgoingCalls')<CR>", {
        desc = "Outgoing calls"
    })

    -- Fix Escape key to exit search/find mode
    map("n", "<ESC>",
        "<cmd>call VSCodeNotify('closeFindWidget')<CR><cmd>call VSCodeNotify('closeReferenceSearch')<CR><cmd>call VSCodeNotify('closeReplaceInFilesWidget')<CR><cmd>call VSCodeNotify('workbench.action.closeQuickOpen')<CR><ESC>",
        {
            desc = "Exit search/find mode",
            silent = true
        })
    map("n", "<Esc>", "<Esc>:noh<CR>", opts)
    
    -- Enable Vim navigation in search panel
    map("n", "<leader>sv", "<cmd>call VSCodeNotify('toggleSearchEditorRegex')<CR>", {
        desc = "Toggle search with Vim regex"
    })
    
    -- Search panel navigation with Vim keys
    map("n", "/", "<cmd>call VSCodeNotify('actions.find')<CR>", {
        desc = "Find in current file with Vim keys"
    })
    
    -- Enable Vim keybindings in search panel
    map("n", "n", "<cmd>call VSCodeNotify('editor.action.nextMatchFindAction')<CR>", {
        desc = "Next search match"
    })
    map("n", "N", "<cmd>call VSCodeNotify('editor.action.previousMatchFindAction')<CR>", {
        desc = "Previous search match"
    })
    
    -- Terminal specific mappings
    map("t", "<Esc>", "<C-\\><C-n>", {
        desc = "Exit terminal insert mode",
        silent = true
    })
    map("t", "jk", "<C-\\><C-n>", {
        desc = "Exit terminal insert mode with jk",
        silent = true
    })
end

return M
