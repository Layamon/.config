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
						"/opt/homebrew/opt/llvm@19/bin/clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=never",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"-j=2",
-- disable in mac, since mac allocator not support						"--malloc-trim",
						"--fallback-style=llvm",
					},
				},
				--bacon_ls = {
				--	enabled = "bacon-ls",
				--},
				rust_analyzer = {
					enabled = true,
					cmd = { "/home/liuyangming/.cargo/bin/rust-analyzer" },
					settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
							checkOnSave = { command = "clippy" },
						},
					},
				},
			},
			setup = {
				rust_analyzer = function(_, opts)
					local lspconfig = require("lspconfig")
					lspconfig.rust_analyzer.setup(opts)

					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = "*.rs",
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
					return true
				end,
			},
		}

	}
}
