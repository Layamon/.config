require 'nightfox'.setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			functions = "italic",
			--      types = "bold",
		}
	}
})
require('lualine').setup {
	options = {
		theme = 'solarized_light',
		component_separators = '',
		section_separators = { left = '', right = '' },
	},
	inactive_sections = {
		lualine_c = { '%f %y %m' },
		lualine_x = {},
	},
}

vim.opt.background = "light"
vim.cmd([[
colorscheme dayfox
]])
