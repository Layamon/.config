local Util = require("lazyvim.util")

return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>d",  "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
		{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
	},
}
