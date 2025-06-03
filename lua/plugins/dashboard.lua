return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            vim.keymap.set("n", "<leader>h",  "<cmd>Dashboard<CR>"),
            theme = 'hyper',
            config = {},
            hide = {
            },
            preview = {
            },
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
