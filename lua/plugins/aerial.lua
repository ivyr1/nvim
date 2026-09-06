return {
	"stevearc/aerial.nvim",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function(_, opts)
		require("aerial").setup({
			backends = { "treesitter", "lsp" },
			layout = {
				default_direction = "right",
				width = 35,
			},
			show_guides = true,
			filter_kind = false,
		})
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Symbol Tree" })
	end,
}
