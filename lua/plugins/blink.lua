return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = {
            preset = 'enter',
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'normal'
        },

        completion = {
            documentation = {
                treesitter_highlighting = true,
            },
            ghost_text = {
                enabled = true
            },
        },
        signature = {
            enabled = true,
            window = { border = 'none' }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" },
}
