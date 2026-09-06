return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
		float_opts = {
			border = "curved",
		},
		on_open = function(term)
			vim.cmd("startinsert!")
			if term.job_id then
				vim.api.nvim_chan_send(term.job_id, "make\n")
			end
		end,
	},
	keys = {
		{ "<space>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal (Runs make)" },
		{ "<space>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
		{ "<space>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Horizontal Terminal" },
	},
}
