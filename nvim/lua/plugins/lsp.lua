return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
			},
			servers = {
				-- Ensure mason installs the server
				clangd = {
					mason = false,
					keys = {
						{ "11", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
					},
					on_attach = function(client, bufnr)
						require("nvim-navic")
							.attach(client, bufnr)
					end,
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=never",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"-j=2", "--malloc-trim",
						"--fallback-style=llvm",
					},
				},
				rust_analyzer = { enabled = true },
			},
		}

	}
}
