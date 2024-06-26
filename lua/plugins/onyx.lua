return {
	"onyx-lang/onyx.vim",
	config = function()
		vim.filetype.add({
			extension = {
				onyx = "onyx",
			},
			pattern = {
				[".*onyx$"] = "onyx",
			},
		})
	end,
}
