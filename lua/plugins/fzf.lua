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
            vim.keymap.set("n", "<leader>f.",  "<cmd>FzfLua files cwd=~/<CR>"),
            vim.keymap.set("n", "<leader>ff.", "<cmd>FzfLua files cwd=/<CR>"),
            vim.keymap.set("n", "<leader>bb",  "<cmd>FzfLua buffers<CR>"),
            vim.keymap.set("n", "<leader>sw",  "<cmd>FzfLua grep_cword<CR>"),
            vim.keymap.set("n", "<leader>s/",  "<cmd>FzfLua live_grep_native<CR>"),
        }
    end,
}
