local Util = require("lazyvim.util")

return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>d",  ":DiffviewOpen ", desc = "Open diffview" },
		{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
	},
}
