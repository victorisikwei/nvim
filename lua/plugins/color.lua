return {
	"savq/melange-nvim",
	opts = {},
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("melange")
		vim.api.nvim_set_hl(0, "Normal", { bg = "#19191B", fg = "#E49B5D" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })
		vim.api.nvim_set_hl(0, "Identifier", { bg = "none", fg = "#E49B5D" })
		vim.api.nvim_set_hl(0, "@variable", { bg = "none", fg = "#dbb591" })
		vim.api.nvim_set_hl(0, "@string", { bg = "none", fg = "#8895AA" })
		vim.api.nvim_set_hl(0, "Comment", { bg = "none", fg = "#9C9090" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
		vim.api.nvim_set_hl(0, "Whitespace", { fg = "#29292A" })
	end,
	-- "tiagovla/tokyodark.nvim", for future use
}
