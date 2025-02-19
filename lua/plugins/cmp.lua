return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    event = 'InsertEnter',
    opts = {},
    config = function()
        local cmp = require('cmp')

        local toggle_view = function()
            local current = cmp.get_config().view.entries.name
            if current == nil or current == 'wildmenu' then
                cmp.setup({ view = { entries = { name = 'custom', selection_order = 'near_cursor' } } })
            else
                cmp.setup({ view = { entries = { name = 'wildmenu', separator = ' | ' } } })
            end
        end

        cmp.setup({
            experimental = { ghost_text = true },
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            view = { entries = { name = 'wildmenu', separator = ' | ' } },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'render-markdown' },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
        })
    end
}
