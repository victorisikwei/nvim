return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
    },
    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                buffers = {
                    theme = "ivy",
                },
                help_tags = {
                    theme = "ivy",
                },
            },
            extensions = {
                fzf = {},
            },
        })
        require("telescope").load_extension("fzf")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-p>", function()
            builtin.find_files({
                hidden = true,
                no_ignore = true,
            })
        end)
        vim.keymap.set("n", "<leader>f", function()
            builtin.find_files({
                hidden = true,
                no_ignore = true,
                cwd = "~/", -- Fix it doesn't include dot directories
            })
        end)
        vim.keymap.set("n", "<leader>b", builtin.buffers)

        ---- For greping -------------------------
        ------------------------------------
        local live_multigrep = function(opts)
            local theme = require("telescope.themes")
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local make_entry = require("telescope.make_entry")
            local conf = require("telescope.config").values
            opts = opts or {}
            opts.cwd = opts.cwd or vim.uv.cwd()

            local finder = finders.new_async_job({
                command_generator = function(prompt)
                    if not prompt or prompt == "" then
                        return nil
                    end

                    local pieces = vim.split(prompt, "  ")
                    local args = { "rg" }
                    if pieces[1] then
                        table.insert(args, "-e")
                        table.insert(args, pieces[1])
                    end

                    if pieces[2] then
                        table.insert(args, "-g")
                        table.insert(args, pieces[2])
                    end

                    ---@diagnostic disable-next-line: deprecated
                    return vim.tbl_flatten({
                        args,
                        {
                            "--color=never",
                            "--no-heading",
                            "--with-filename",
                            "--line-number",
                            "--column",
                            "--smart-case",
                        },
                    })
                end,
                entry_maker = make_entry.gen_from_vimgrep(opts),
                cwd = opts.cwd,
            })

            opts = require("telescope.themes").get_ivy({})

            pickers
            .new(opts, {
                debounce = 100,
                prompt_title = "Multi Grep",
                finder = finder,
                previewer = conf.grep_previewer(opts),
                sorter = require("telescope.sorters").empty(),
            })
            :find()
        end
        -- pickers.new(require("telescope.themes").get_ivy(opts), {})
        vim.keymap.set("n", "<leader>g", live_multigrep)
    end,
}
