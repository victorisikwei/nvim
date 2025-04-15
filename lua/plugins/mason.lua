return {
    "williamboman/mason.nvim",
    opts = {},
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
                keymaps = {
                    ---@since 1.8.0
                    -- Keymap to toggle the help view
                    toggle_help = "?",
                },
            }
        })
    end
}
