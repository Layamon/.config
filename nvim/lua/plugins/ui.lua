return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	{
		"folke/noice.nvim",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = true,
			},
		}
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static",
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		}
	},
	{
		"folke/noice.nvim",
		opts = {
			presets = {
				-- you can enable a preset by setting it to true, or a table that will override the preset config
				-- you can also add custom presets that you can enable/disable with enabled=true
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
			},
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						min_width = 60,
						width = "auto",
						height = "auto",
					},
				},
				cmdline_popupmenu = {
					relative = "editor",
					position = {
						row = "63%",
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
						max_height = 15,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
					},
				},
			},
		}
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						functions = "italic",
						types = "bold",
					},
				},
			})
		end,
	},
	{
		'sainnhe/everforest',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = 'medium'
		end
	},
    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_background= 'medium'
      end
    },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic",
		},
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox-material",
					component_separators = "",
					section_separators = { left = "", right = "" },
				},
				inactive_sections = {
					lualine_c = { "%f %y %m" },
					lualine_x = {},
				},
				sections = {
					lualine_c = {
						{ 'filename' },
						{ 'navic',   color_correction = 'static' },
					}
				}
			})
		end,
	},
}
