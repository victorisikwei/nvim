return {
	"stevearc/oil.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		opts = {},
	},
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	opts = {},
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["t"] = "actions.select_tab",
				["<CR>"] = "actions.select",
				["<C-2>"] = "actions.refresh",
				["<C-v>"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
				["<C-x>"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open the entry in a horizontal split",
				},
				[" d"] = "actions.close",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["<C-l>"] = "actions.refresh",
				["`"] = "actions.cd",
				["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		})
	end,
}
