return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    -- opts = {},
    opts = function(_, opts)
        -- local config = require("fzf-lua.config")
        -- Refer: https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/defaults.lua
        local file_win_opts = {
            fullscreen = true,
            border = "none",
            preview = {
                layout = "vertical",
                vertical = "up:70%",
                border = "none"
            },
        }
        return {
            defaults = {
                -- formatter = "path.dirname_first",
                formatter = "path.filename_first",
            },
            files = { winopts = file_win_opts },
            buffers = { winopts = file_win_opts },
            grep = { winopts = file_win_opts },
            oldfiles = { winopts = file_win_opts },
            git = {
                files = {
                    winopts = file_win_opts,
                },
            },
        }
    end,
    keys = {
        { "<leader>f", function() require('fzf-lua').files({ cwd = '~/' }) end, desc = "find files in the home directory" },
        { "<leader>`", function() require('fzf-lua').files({ cwd = '/' }) end,  desc = "find files in the system" },
        { "<leader>p", function() require('fzf-lua').files({ cwd = './' }) end, desc = "find files in the current working directory" },
        { "<leader>b", function() require('fzf-lua').buffers() end,             desc = "find buffers" },
        { "<leader>g", function() require('fzf-lua').grep() end,                desc = "find grep file" },
        { "<leader>l", function() require('fzf-lua').live_grep() end,           desc = "live grep" },
    },
}
