local Util = require("lazyvim.util")

return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {},
		keys = {
			{ "<leader><space>", "<cmd>wa<cr>", desc = "Save files" }
		},
		keymap = {
			fzf = {
				["j"] = "down",
				["k"] = "up",
			},
		}
	}
}
