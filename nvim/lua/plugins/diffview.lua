local Util = require("lazyvim.util")

return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>d",  ":DiffviewOpen ", desc = "Open diffview" },
		{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
		{ "<leader>df", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
	},
	default_args = {
		DiffviewOpen = { "^!" }, -- 让 :DiffviewOpen 默认为单次提交模式
	},
}
