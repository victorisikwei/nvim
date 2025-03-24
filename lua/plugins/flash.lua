return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		-- local flash = require("flash")
		vim.keymap.set("n", "s", function()
			require("flash").jump()
		end)
	end,
	-- keys = {
	-- 	{
	-- 		"8",
	-- 		mode = { "n", "x", "o" },
	-- 		function()
	-- 			require("flash").toggle()
	-- 		end,
	-- 		desc = "Toggle Flash Search",
	-- 	},
	-- },
}
