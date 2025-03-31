return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	-- you can set set configuration options here
	config = function()
		vim.cmd("set termguicolors")
		vim.cmd.colorscheme("gruvbox")
		vim.cmd("set background=light")
		vim.api.nvim_set_hl(0, "Visual", { bg = "#A8B4C0" })
	end,
}
