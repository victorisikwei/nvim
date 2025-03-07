return {
	"savq/melange-nvim",
	opts = {},
	config = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("melange")
		vim.cmd([[
        highlight Normal ctermbg=0 guifg=#dbb591 guibg=#000000
        highlight SignColumn ctermbg=0 guibg=#000000
        highlight LineNr ctermbg=0 guibg=#000000
        highlight NormalFloat ctermbg=0 guibg=#000000
        highlight FloatBorder ctermbg=0 guibg=#000000
        highlight FloatFooter ctermbg=0 guibg=#000000
        ]])
	end,
	-- "tiagovla/tokyodark.nvim", for future use
}
