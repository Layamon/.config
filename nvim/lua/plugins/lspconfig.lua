-- ============================================================================
-- reference
-- 1. https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- 2. https://github.com/hrsh7th/nvim-cmp
-- ============================================================================

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local opts = { noremap = true, silent = true }
local keymap = function(lhs, rhs)
	return vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

keymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

local function lsp_keymaps(bufnr)
	local buf_keymap = function(lhs, rhs)
		return vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, opts)
	end
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_keymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
	buf_keymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
	buf_keymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
	buf_keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	buf_keymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
	--buf_keymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
end

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	lsp_keymaps(bufnr)
end

local lspconfig = require('lspconfig')
-- add additional capabilities supported by nvim-cmp
local cap = vim.lsp.protocol.make_client_capabilities()
cap = require('cmp_nvim_lsp').default_capabilities(cap)
cap.textDocument.semanticHighlighting = true
cap.offsetEncoding = "utf-8"
lspconfig.clangd.setup {
	on_attach = on_attach,
	capabilities = cap,
	cmd = { "clangd" },
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = cap,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
				disable = { 'missing-fields' }
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique
			-- identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

vim.keymap.set('x', '<leader>f', "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opts)
vim.keymap.set('n', 'fm', "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opts)
vim.keymap.set('n', '11', "<cmd>ClangdSwitchSourceHeader<CR>", opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)


vim.diagnostic.config({
	virtual_text = false,
	float = {
		scope = "cursor"
	}
})
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
	-- THIS IS FOR BUILTIN LSP
	vim.diagnostic.open_float(0, {
		scope = "cursor",
		focusable = false,
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
		},
	})
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	command = "lua OpenDiagnosticIfNoFloat()",
	group = "lsp_diagnostics_hold",
})
