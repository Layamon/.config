vim.opt.shell = "/bin/bash"

PluginList = {
	'core/basic',
	'packer_init',
	'plugins/ui',
	'plugins/lspconfig',
	'plugins/telescope',
	'plugins/nvimtree',
	'plugins/leap',
	'plugins/diffview',
	'plugins/gitsign',
	'plugins/nvimufo',
	'plugins/whichkey',
	'plugins/treesitter',
	'plugins/ibl',
	'plugins/interestingwords',
	'plugins/zen',
	'plugins/trouble',
	'plugins/nvim-cmp',
}

for _, plugin_name in ipairs(PluginList) do
	local _ = require(plugin_name);
end
