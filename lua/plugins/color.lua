return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme kanagawa")
		require("kanagawa").setup({
			theme = "wave",
			vim.cmd.hi("Normal guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("NormalFloat guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("FloatTitle guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("FloatBorder guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("SignColumn guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("LineNr guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("TabLine guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("TabLineFill guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("TelescopeBorder guibg=NONE ctermbg=NONE"),
			--[[ vim.cmd.hi("NoicePopupmenuBorder guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("NoiceCmdlinePromptBorder guibg=NONE ctermbg=NONE"), ]]

			-- vim.cmd.hi("NoiceCmdlineBorder guibg=NONE ctermbg=NONE"),
			-- vim.cmd.hi("NoicePopupTitle guibg=NONE ctermbg=NONE"),

			--[[ vim.cmd.hi("TelescopeBorder guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("TelescopePromptBorder guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("TelescopeResultsBorder guibg=NONE ctermbg=NONE"),
			vim.cmd.hi("TelescopePreviewBorder guibg=NONE ctermbg=NONE"), ]]
		})
	end,
}
