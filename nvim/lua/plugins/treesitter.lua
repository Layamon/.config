vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
require "nvim-treesitter.configs".setup {
	ensure_installed = { "cpp", "lua", "bash", "python", "go", "vim" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	-- indent = {
	--     enable = true
	-- },
	context_commentstring = {
		enable = false
	},
	textobjects = {
		select = {
			enable = false,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			}
		}
	}
}
require('spellsitter').setup()
