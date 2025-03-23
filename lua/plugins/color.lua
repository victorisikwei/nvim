return {
	"savq/melange-nvim",
	opts = {},
	config = function()
		-- vim.opt.termguicolors = true
		vim.cmd.colorscheme("melange")
		vim.api.nvim_set_hl(0, "Normal", { bg = "#0E0E0E", fg = "#E2BC9C" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#140608" })
		vim.api.nvim_set_hl(0, "Whitespace", { fg = "#2A2A2A" })
		vim.api.nvim_set_hl(0, "Comment", { fg = "#927E7E" })
		vim.api.nvim_set_hl(0, "Cursor", { fg = "#E2BC9C" })
		vim.api.nvim_set_hl(0, "lCursor", { bg = "#E2BC9C" })
	end,
	-- "tiagovla/tokyodark.nvim", for future use
}
