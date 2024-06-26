return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["g?"] = "actions.show_help",
			-- ["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			-- ["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["q"] = "actions.toggle_close",
			-- ["g\\"] = "actions.toggle_trash",
		},
		view_options = {
			show_hidden = true,
		},
	},
	config = function()
		local config = require("oil")
		config.setup({
			vim.keymap.set("n", "<leader>e", config.open_float, {}),
			vim.keymap.set("n", "q", config.toggle_float, {}),
			float = {
				-- Padding around the floating window
				padding = 10,
				max_width = 100,
				max_height = 20,
				border = "rounded",
				--[[ 	win_options = {
					winblend = 8,
				}, ]]
				--[[ override = function(conf)
				-- conf.row = (vim.o.lines - conf.height - 3)
				conf.height = 5
				return conf
			end, ]]
			},
			columns = {
				"icon",
				"size",
				-- "mtime",
			},
			-- vim.keymap.set("n", "q", config.close, {}),
		})
	end,
}
