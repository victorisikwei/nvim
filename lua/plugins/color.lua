return {
    -- 'AlexvZyl/nordic.nvim',
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
        --     require('nordic').load()
        --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        --     vim.api.nvim_set_hl(0, "FloatBorder", { fg = "none", bg = "none" })
        -- end
        --
        --
        "tiagovla/tokyodark.nvim",
        opts = {
            -- custom options here
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme tokyodark]]
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,

        -- vim.api.nvim_set_hl(0, "Normal", { bg = "#1e2326" })
        -- -- vim.api.nvim_set_hl(0, "Visual", { bg = "#708090", fg = "#DEEEED" })
        -- vim.api.nvim_set_hl(0, "Whitespace", { fg = "#2B302C" })
        -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292E3B" })
        -- -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#575F63" })
    }
