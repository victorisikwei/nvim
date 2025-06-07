return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- Default options:
        require('kanagawa').setup({
            compile = false,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = { bold = true },
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = { italic = true },
            transparent = false,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave",              -- Load "wave" theme
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        })

        -- setup must be called before loading
        vim.cmd("colorscheme kanagawa")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none"})
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none"})
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#150F17" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLineNr", {fg = "#FFA066", bg = "#150F17" })
    end,
}        

-- color0 #16161D
-- color1 #C34043
-- color2 #76946A
-- color3 #C0A36E
-- color4 #7E9CD8
-- color5 #957FB8
-- color6 #6A9589
-- color7 #C8C093

-- color8  #727169
-- color9  #E82424
-- color10 #98BB6C
-- color11 #E6C384
-- color12 #7FB4CA
-- color13 #938AA9
-- color14 #7AA89F
-- color15 #DCD7BA


-- color16 #FFA066
-- color17 #FF5D62

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#1e2326" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Whitespace", { fg = "#2B302C" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292E3B" })
-- -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#575F63" })
