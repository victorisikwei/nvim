return {
    'echasnovski/mini.statusline',
    version = false,
    opts = {},
    config = function()
        -- Global flag to track zoom state
        ZOOMED = false

        -- Function to toggle zoom mode
        -- function ToggleZoom()
        --     if not ZOOMED then
        --         vim.cmd("tabnew %")
        --         ZOOMED = true
        --     else
        --         vim.cmd("close")
        --         ZOOMED = false
        --     end
        -- end

        -- Keybinding to toggle zoom mode with Ctrl + m
        -- vim.keymap.set("n", "<C-m>", ToggleZoom, { desc = "Toggle Zoom Tab" })

        -- Setup mini.statusline with custom active content
        require('mini.statusline').setup({
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git           = MiniStatusline.section_git({ trunc_width = 40 })
                    local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
                    local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location      = MiniStatusline.section_location({ trunc_width = 75 })
                    local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
                    -- Define the zoom indicator
                    -- local zoom          = ZOOMED and '[ZOOMED]' or ''

                    return MiniStatusline.combine_groups({
                        { hl = mode_hl,                 strings = { mode } },
                        { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
                        '%<', -- Mark general truncate point
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                        '%=', -- End left alignment
                        -- { hl = 'MiniStatuslineZoom',     strings = { zoom } },
                        '%=',
                        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                        { hl = mode_hl,                  strings = { search, location } },
                    })
                end
            }
        })
    end

}
