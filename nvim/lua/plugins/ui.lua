return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						functions = "italic",
						--      types = "bold",
					},
				},
				vim.cmd([[ colorscheme dayfox ]]),
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "solarized_light",
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				inactive_sections = {
					lualine_c = { "%f %y %m" },
					lualine_x = {},
				},
			})
		end,
	},
}
