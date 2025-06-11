-- VSCode Neovim Integration
local M = {}

local whichkey = {
    show = function()
        vim.fn.VSCodeNotify("whichkey.show")
    end
}

local comment = {
    selected = function()
        vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
    end
}

local file = {
    new = function()
        vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
        vim.fn.VSCodeNotify("explorer.newFile")
    end,

    save = function()
        vim.fn.VSCodeNotify("workbench.action.files.save")
    end,

    saveAll = function()
        vim.fn.VSCodeNotify("workbench.action.files.saveAll")
    end,

    format = function()
        vim.fn.VSCodeNotify("editor.action.formatDocument")
    end,

    showInExplorer = function()
        vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    end,

    rename = function()
        vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
        vim.fn.VSCodeNotify("renameFile")
    end
}

local error = {
    list = function()
        vim.fn.VSCodeNotify("workbench.actions.view.problems")
    end,
    next = function()
        vim.fn.VSCodeNotify("editor.action.marker.next")
    end,
    previous = function()
        vim.fn.VSCodeNotify("editor.action.marker.prev")
    end
}

local editor = {
    closeActive = function()
        vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
    end,

    closeOther = function()
        vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
    end,

    organizeImport = function()
        vim.fn.VSCodeNotify("editor.action.organizeImports")
    end
}

local workbench = {
    showCommands = function()
        vim.fn.VSCodeNotify("workbench.action.showCommands")
    end,
    previousEditor = function()
        vim.fn.VSCodeNotify("workbench.action.previousEditor")
    end,
    nextEditor = function()
        vim.fn.VSCodeNotify("workbench.action.nextEditor")
    end
}

local toggle = {
    toggleActivityBar = function()
        vim.fn.VSCodeNotify("workbench.action.toggleActivityBarVisibility")
    end,
    toggleSideBarVisibility = function()
        vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
    end,
    toggleZenMode = function()
        vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
    end,
    theme = function()
        vim.fn.VSCodeNotify("workbench.action.selectTheme")
    end
}

local symbol = {
    rename = function()
        vim.fn.VSCodeNotify("editor.action.rename")
    end
}

-- if bookmark extension is used
local bookmark = {
    toggle = function()
        vim.fn.VSCodeNotify("bookmarks.toggle")
    end,
    list = function()
        vim.fn.VSCodeNotify("bookmarks.list")
    end,
    previous = function()
        vim.fn.VSCodeNotify("bookmarks.jumpToPrevious")
    end,
    next = function()
        vim.fn.VSCodeNotify("bookmarks.jumpToNext")
    end
}

local search = {
    reference = function()
        vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
    end,
    referenceInSideBar = function()
        vim.fn.VSCodeNotify("references-view.find")
    end,
    project = function()
        vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
        vim.fn.VSCodeNotify("workbench.action.findInFiles")
    end,
    text = function()
        vim.fn.VSCodeNotify("workbench.action.findInFiles")
    end
}

local project = {
    findFile = function()
        vim.fn.VSCodeNotify("workbench.action.quickOpen")
    end,
    switch = function()
        vim.fn.VSCodeNotify("workbench.action.openRecent")
    end,
    tree = function()
        vim.fn.VSCodeNotify("workbench.view.explorer")
    end
}

local git = {
    init = function()
        vim.fn.VSCodeNotify("git.init")
    end,
    status = function()
        vim.fn.VSCodeNotify("workbench.view.scm")
    end,
    switch = function()
        vim.fn.VSCodeNotify("git.checkout")
    end,
    deleteBranch = function()
        vim.fn.VSCodeNotify("git.deleteBranch")
    end,
    push = function()
        vim.fn.VSCodeNotify("git.push")
    end,
    pull = function()
        vim.fn.VSCodeNotify("git.pull")
    end,
    fetch = function()
        vim.fn.VSCodeNotify("git.fetch")
    end,
    commit = function()
        vim.fn.VSCodeNotify("git.commit")
    end,
    publish = function()
        vim.fn.VSCodeNotify("git.publish")
    end,

    -- if gitlens installed
    graph = function()
        vim.fn.VSCodeNotify("gitlens.showGraphPage")
    end
}

local fold = {
    toggle = function()
        vim.fn.VSCodeNotify("editor.toggleFold")
    end,

    all = function()
        vim.fn.VSCodeNotify("editor.foldAll")
    end,
    openAll = function()
        vim.fn.VSCodeNotify("editor.unfoldAll")
    end,

    close = function()
        vim.fn.VSCodeNotify("editor.fold")
    end,
    open = function()
        vim.fn.VSCodeNotify("editor.unfold")
    end,
    openRecursive = function()
        vim.fn.VSCodeNotify("editor.unfoldRecursively")
    end,

    blockComment = function()
        vim.fn.VSCodeNotify("editor.foldAllBlockComments")
    end,

    allMarkerRegion = function()
        vim.fn.VSCodeNotify("editor.foldAllMarkerRegions")
    end,
    openAllMarkerRegion = function()
        vim.fn.VSCodeNotify("editor.unfoldAllMarkerRegions")
    end
}

local vscode = {
    focusEditor = function()
        vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
    end,
    moveSideBarRight = function()
        vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
    end,
    moveSideBarLeft = function()
        vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
    end
}

local refactor = {
    showMenu = function()
        vim.fn.VSCodeNotify("editor.action.refactor")
    end
}

-- https://vi.stackexchange.com/a/31887
local nv_keymap = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, {
        noremap = true,
        silent = true
    })
    vim.api.nvim_set_keymap('v', lhs, rhs, {
        noremap = true,
        silent = true
    })
end

local nx_keymap = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, {
        silent = true
    })
    vim.api.nvim_set_keymap('v', lhs, rhs, {
        silent = true
    })
end

-- #region keymap
vim.g.mapleader = " "
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

    -- map("n", "<Space>", "", opts)
    -- Your existing basic mappings
    vim.keymap.set({'n', 'v'}, "<leader>", whichkey.show)
    vim.keymap.set({'n', 'v'}, "<leader>/", comment.selected)
    map("n", ";", ":", {
        desc = "CMD enter command mode"
    })

    -- Command palette
    -- map("n", "<leader><leader>", "<cmd>call VSCodeNotify('workbench.action.showCommands')<CR>", {
    --     desc = "Open command palette"
    -- })
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

    -- Format (matching your <leader>fm)
    map("", "<leader>fm", "<cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", {
        desc = "[F]ormat"
    })

    -- Close all buffers except current (matching your <leader>cb)
    map("n", "<leader>cb", "<cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>", {
        desc = "close all buffers except for the current one"
    })
    vim.keymap.set({'n'}, "H", workbench.previousEditor)
    vim.keymap.set({'n'}, "L", workbench.nextEditor)

    -- bookmark
    vim.keymap.set({'n'}, "<leader>m", bookmark.toggle)
    vim.keymap.set({'n'}, "<leader>mt", bookmark.toggle)
    vim.keymap.set({'n'}, "<leader>ml", bookmark.list)
    vim.keymap.set({'n'}, "<leader>mn", bookmark.next)
    vim.keymap.set({'n'}, "<leader>mp", bookmark.previous)

    -- git
    vim.keymap.set({'n'}, "<leader>gb", git.switch)
    vim.keymap.set({'n'}, "<leader>gi", git.init)
    vim.keymap.set({'n'}, "<leader>gd", git.deleteBranch)
    vim.keymap.set({'n'}, "<leader>gf", git.fetch)
    vim.keymap.set({'n'}, "<leader>gs", git.status)
    vim.keymap.set({'n'}, "<leader>gp", git.pull)
    vim.keymap.set({'n'}, "<leader>gg", git.graph)
    -- Close current buffer
    map("n", "<leader>x", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>", {
        desc = "Close current buffer"
    })

    -- Search/Find (matching your <leader>fr for telescope resume)
    map("n", "<leader>fr", "<cmd>call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditor')<CR>", {
        desc = "Resume recent"
    })

    -- Diagnostics (matching your <leader>db and <leader>dw)
    map({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")

    -- LSP actions (matching your <leader>ca and <leader>sh)
    -- Show all code actions including ESLint
    map("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<CR>", {
        desc = "Show all code actions",
        silent = true
    })
    -- Additional mapping for source actions (ESLint, etc)
    map("n", "<leader>cs", "<cmd>call VSCodeNotify('editor.action.sourceAction')<CR>", {
        desc = "Show source actions (ESLint)",
        silent = true
    })
    map({"n", "v"}, "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")

    -- Additional LSP features
    map("n", "gd", "<cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", {
        desc = "Go to definition"
    })
    map("n", "gr", "<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", {
        desc = "Go to references"
    })
    map("n", "gR", "<cmd>call VSCodeNotify('references-view.find')<CR>", {
        desc = "Go to references in side bar"
    })
    map("n", "gi", "<cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", {
        desc = "Go to implementation"
    })
    map("n", "gt", "<cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>", {
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
    map("n", "<leader>fz", "<cmd>call VSCodeNotify('actions.find')<CR>", {
        desc = "Find in current file"
    })
    map("n", "<leader>fa", "<cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>", {
        desc = "Find and replace in current file"
    })
    map("n", "<leader>fw", "<cmd>call VSCodeNotify('workbench.action.quickTextSearch')<CR>", {
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
    map("n", "<leader>tz", "<cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>", {
        desc = "Toggle zen mode"
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
    -- map("n", "<leader>/", "<cmd>call VSCodeNotify('editor.action.addCommentLine')<CR>", {
    --     desc = "Outgoing calls"
    -- })

    -- Fix Escape key to exit search/find mode
    map("n", "<ESC>",
        "<cmd>call VSCodeNotify('closeFindWidget')<CR><cmd>call VSCodeNotify('closeReferenceSearch')<CR><cmd>call VSCodeNotify('closeReplaceInFilesWidget')<CR><cmd>call VSCodeNotify('workbench.action.closeQuickOpen')<CR><ESC>",
        {
            desc = "Exit search/find mode",
            silent = true
        })
    map("n", "<Esc>", "<Esc>:noh<CR>", opts)

    -- Terminal mappings (additional)
    map({"n", "v"}, "<leader>tt", "<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>", {
        desc = "Toggle terminal panel"
    })
    map({"n", "v"}, "<leader>ts", "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", {
        desc = "Show terminal sidebar"
    })
    map({"n", "v"}, "<leader>tn", "<cmd>call VSCodeNotify('terminal.new')<CR>", {
        desc = "New terminal instance"
    })
    map({"n", "v"}, "<leader>tk", "<cmd>call VSCodeNotify('workbench.action.terminal.kill')<CR>", {
        desc = "Kill terminal instance"
    })

    -- Fold mappings
    map("n", "za", "<cmd>call VSCodeNotify('editor.toggleFold')<CR>", {
        desc = "Toggle fold under cursor"
    })
    map("n", "zc", "<cmd>call VSCodeNotify('editor.fold')<CR>", {
        desc = "Fold region at cursor"
    })
    map("n", "zo", "<cmd>call VSCodeNotify('editor.unfold')<CR>", {
        desc = "Unfold region at cursor"
    })
    map("n", "zM", "<cmd>call VSCodeNotify('editor.foldAll')<CR>", {
        desc = "Fold all regions"
    })
    map("n", "zR", "<cmd>call VSCodeNotify('editor.unfoldAll')<CR>", {
        desc = "Unfold all regions"
    })
    map("n", "<leader>zf", "<cmd>call VSCodeNotify('editor.foldRecursively')<CR>", {
        desc = "Fold recursively"
    })
    map("n", "<leader>zu", "<cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>", {
        desc = "Unfold recursively"
    })
end

return M
