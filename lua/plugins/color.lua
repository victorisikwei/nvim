return {
    "bluz71/vim-nightfly-colors", 
    name = "nightfly", 
    lazy = false, 
    priority = 1000,
    config = function()
        vim.cmd [[colorscheme nightfly]]
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none"})
    end

}        

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1e2326" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Whitespace", { fg = "#2B302C" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292E3B" })
-- -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#575F63" })
