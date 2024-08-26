local Util = require("lazyvim.util")

return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			pickers = {
				-- telescope live_grep is not fuzzy match,
				-- grep_string is not working when project
				-- has too much files, we can first live_grep
				-- to make file scope smaller then press <c-f>
				-- to fuzzy search condidate files.
				live_grep = {
					mappings = {
						i = { ["<c-f>"] = require('telescope.actions').to_fuzzy_refine },
					},
				},
			},
		},

		keys = {
			{ "<leader>:",       "<cmd>Telescope command_history<cr>",                                                       desc = "Command History" },
			{ "<leader><space>", "<cmd>wa<cr>",                                                                              desc = "Save files" },
			-- buffers
			{ "<leader>b",       "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",                              desc = "Buffers" },
			-- find files
			--{ "<leader>fc",      Util.telescope.config_files(),                                                              desc = "Find Config File" },
			{ "<leader>f",       "<cmd>Telescope git_files<cr>",                                                             desc = "Find Files (git-files)" },
			{ "<leader>F",       "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=> <cr>", desc = "Find Files (root dir)" },
			{ "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                                                              desc = "Recent" },
			-- grep text
			-- not working when has too much files such as > 20000 files.
			{ "<leader>/",      "<cmd>Telescope live_grep<cr>",                                                                desc = "Grep (root dir)" },
			{ "<leader>g",       "<cmd>Telescope current_buffer_fuzzy_find<cr>",                                             desc = "Buffer" },
			{
				"<leader>G",
				function()
					require('telescope.builtin').grep_string({
						shorten_path = true,
						word_match = "-w",
						only_sort_text = true,
						search =
						''
					})
				end,
				desc = "Fuzzy Grep (cwd)"
			},
			-- search symbols
			{ '<leader>t',  "<cmd>Telescope lsp_document_symbols<cr>",                desc = "Find Document Symbols" },
			{
				"<leader>s",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols({
						symbols = require("lazyvim.config").get_kind_filter(),
					})
				end,
				desc = "Goto Symbol (Workspace)",
			},

			-- others
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>",                        desc = "Auto Commands" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>",                     desc = "Command History" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>",                            desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>",                 desc = "Document diagnostics" },
			{ "<leader>sD", "<cmd>Telescope diagnostics<cr>",                         desc = "Workspace diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                           desc = "Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>",                          desc = "Search Highlight Groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>",                             desc = "Key Maps" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>",                           desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>",                               desc = "Jump to Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>",                         desc = "Options" },
			{ "<leader>sR", "<cmd>Telescope resume<cr>",                              desc = "Resume" },
			{ "<leader>uC", "<cmd>Telescope colorschema<cr>", desc = "Colorscheme with preview" },
		}
	},
}
