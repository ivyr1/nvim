return {
	"jake-stewart/multicursor.nvim",
	branch = "main",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		local set = vim.keymap.set

		-- Thêm hoặc bỏ qua cursor ở dòng trên / dòng dưới
		set({ "n", "v" }, "<up>", function()
			mc.lineAddCursor(-1)
		end, { desc = "Add cursor above" })
		set({ "n", "v" }, "<down>", function()
			mc.lineAddCursor(1)
		end, { desc = "Add cursor below" })
		set({ "n", "v" }, "<leader><up>", function()
			mc.lineSkipCursor(-1)
		end, { desc = "Skip cursor above" })
		set({ "n", "v" }, "<leader><down>", function()
			mc.lineSkipCursor(1)
		end, { desc = "Skip cursor below" })

		-- Thêm hoặc bỏ qua cursor theo từ/ký tự khớp tiếp theo (tương tự Ctrl+D ở VSCode)
		set({ "n", "v" }, "<C-n>", function()
			mc.matchAddCursor(1)
		end, { desc = "Add cursor at next match" })
		set({ "n", "v" }, "<C-s>", function()
			mc.matchSkipCursor(1)
		end, { desc = "Skip next match" })
		set({ "n", "v" }, "<C-p>", function()
			mc.matchAddCursor(-1)
		end, { desc = "Add cursor at prev match" })
		set({ "n", "v" }, "<C-x>", function()
			mc.matchSkipCursor(-1)
		end, { desc = "Skip prev match" })

		-- Thêm cursor cho tất cả các từ khớp trong buffer
		set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors, { desc = "Add cursors to all matches" })

		-- Xóa con trỏ hiện tại
		set({ "n", "v" }, "<leader>x", mc.deleteCursor, { desc = "Delete current cursor" })

		-- Chuyển đổi con trỏ chính (main cursor)
		set({ "n", "v" }, "<left>", mc.nextCursor, { desc = "Next cursor" })
		set({ "n", "v" }, "<right>", mc.prevCursor, { desc = "Prev cursor" })

		-- Nhấn Esc để hủy tất cả con trỏ phụ
		set("n", "<Esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				vim.cmd("nohlsearch")
			end
		end, { desc = "Clear cursors or search highlight" })

		-- Căn chỉnh các con trỏ (Align cursors)
		set("n", "<leader>a", mc.alignCursors, { desc = "Align cursors" })

		-- Hỗ trợ Visual mode: Thêm con trỏ ở đầu/cuối mỗi dòng được chọn
		set("v", "I", mc.insertVisual, { desc = "Insert at start of visual selection" })
		set("v", "A", mc.appendVisual, { desc = "Append at end of visual selection" })

		-- Highlight màu cho multicursor
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { link = "Cursor" })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
	end,
}
