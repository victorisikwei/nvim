return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        require('oil').setup({
            vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>"),
            vim.keymap.set("n", "<leader>.", ":e ~/"),
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            keymaps = {
                ["<C-v>"] = { "actions.select", opts = { vertical = true } },
                ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
                ["q"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["g."]    = { "actions.toggle_hidden", mode = "n" },
            }
        })
    end
}
