return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
        require('render-markdown').setup({
            completions = { blink = { enabled = true } },
            -- Useful context to have when evaluating values.
            -- | level    | the number of '#' in the heading marker         |
            -- | sections | for each level how deeply nested the heading is |
            heading = {
                -- Turn on / off heading icon & background rendering.
                enabled = true,
                backgrounds = {
                    'none',
                    'none',
                    'none',
                    'none',
                    'none',
                    'none',
                },
                custom = {},
            },
        })
    end
}
