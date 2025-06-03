return {
    "nvim-treesitter/nvim-treesitter",
    opts = {},
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "nim", "markdown", "markdown_inline" },
            sync_install = false,
            auto_install = true,
            ignore_install = { "javascript" },
            highlight = {
                enable = true,
            },
        })
    end,
}
