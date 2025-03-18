return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		local cfg = {
			on_attach = function(client, bufnr)
				require("lsp_signature").on_attach({
					bind = true,
					handler_opts = {
						border = "rounded",
					},
				}, bufnr)
			end,
		}
		require("lsp_signature").setup(cfg)
	end,
}
