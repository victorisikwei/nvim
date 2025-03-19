return {
	"savq/melange-nvim",
	opts = {},
	config = function()
		-- vim.opt.termguicolors = true
		vim.cmd.colorscheme("melange")
		vim.api.nvim_set_hl(0, "Normal", { bg = "#1B1B1B", fg = "#B66969" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#110707" })
		vim.api.nvim_set_hl(0, "Whitespace", { fg = "#252525" })
		vim.api.nvim_set_hl(0, "Comment", { fg = "#525151" })
	end,
	-- "tiagovla/tokyodark.nvim", for future use
}
