return {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
    },
    config = function ()
        require('kanagawa-paper').setup({
        -- local colors = require("kanagawa-paper.colors").setup()
            overrides = function(colors)
                return {
                    Normal = { bg = "#16161D"},
                    NormalNC = { bg = "#16161D"},
                    NormalFloat = { bg = "#16161D" },
                    FloatBorder = { bg = "#16161D" },
                    FloatTitle = { bg = "#16161D" },
                }
            end,
        })
        vim.cmd("colorscheme kanagawa-paper")
    end
}
