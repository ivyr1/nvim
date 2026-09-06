return {
	{
		"hoangloi07/rusty",
		lazy = false,
		priority = 1000,
	},
	{
		"Aejkatappaja/sora",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			no_italic = true,
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		build = false,
	},
	{
		"shatur/neovim-ayu",
		config = function()
			require("ayu").setup({
				mirage = true,
				terminal = true,
				overrides = {},
			})
		end,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		config = function(_, opts)
			vim.cmd.colorscheme("gruber-darker")
		end,
	},
}
