return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "simple",
			options = {
				show_source = true,
				use_icons_from_diagnostic = true,
				multilines = true,
			},
		})
		vim.diagnostic.config({ virtual_text = false })
	end,
}
