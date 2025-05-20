return {
    "echasnovski/mini.files",
    version = "false",
    opts = {},
    config = function()
        local map_split = function(buf_id, lhs, direction)
            local rhs = function()
                -- Make new window and set it as target
                local cur_target = MiniFiles.get_explorer_state().target_window
                local new_target = vim.api.nvim_win_call(cur_target, function()
                    vim.cmd(direction .. ' split')
                    return vim.api.nvim_get_current_win()
                end)

                MiniFiles.set_target_window(new_target)
            end

            -- Adding `desc` will result into `show_help` entries
            local desc = 'Split ' .. direction
            vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
        end

        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(args)
                local buf_id = args.data.buf_id
                -- Tweak keys to your liking
                map_split(buf_id, '<C-s>', 'belowright horizontal')
                map_split(buf_id, '<C-v>', 'belowright vertical')
            end,
        })

        require("mini.files").setup({
            vim.keymap.set("n", "<leader>e", function()
                local buf_name = vim.api.nvim_buf_get_name(0)
                local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
                MiniFiles.open(path)
                MiniFiles.reveal_cwd()
            end, { desc = "Open Mini Files" }),

            -- No need to copy this inside `setup()`. Will be used automatically.
            -- Customization of shown content
            content = {
                -- Predicate for which file system entries to show
                filter = nil,
                -- What prefix to show to the left of file system entry
                prefix = nil,
                -- In which order to show file system entries
                sort = nil,
            },

            -- Module mappings created only inside explorer.
            -- Use `''` (empty string) to not create one.
            mappings = {
                close = "<C-q>",
                go_in = "=",
                go_in_plus = "<CR>",
                go_out = "-",
                -- go_out = "-",
                -- go_out_plus = "H",
                mark_goto = "'",
                mark_set = "m",
                reset = "<BS>",
                reveal_cwd = "@",
                show_help = "g?",
                synchronize = "<C-a>",
                trim_left = "<",
                trim_right = ">",
            },

            -- General options
            options = {
                -- Whether to delete permanently or move into module-specific trash
                permanent_delete = true,
                -- Whether to use for editing directories
                use_as_default_explorer = true,
            },

            -- Customization of explorer windows
            windows = {
                -- Maximum number of windows to show side by side
                -- max_number = math.huge,
                max_number = 1,
                -- Whether to show preview of file/directory under cursor
                preview = true,
                -- Width of focused window
                width_focus = 50,
                -- Width of non-focused window
                width_nofocus = 15,
                -- Width of preview window
                width_preview = 50,
            },
        })
    end,
}
