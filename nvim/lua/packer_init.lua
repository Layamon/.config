-- packer.nvim
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
end

function MergeTable(table_1, table_2)
	for k, v in pairs(table_2) do
		if type(v) == "table" then
			if type(table_1[k] or false) == "table" then
				MergeTable(table_1[k] or {}, table_2[k] or {})
			else
				table_1[k] = v
			end
		else
			table_1[k] = v
		end
	end
	return table_1
end

require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- UI
	use "EdenEast/nightfox.nvim"
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use { "lukas-reineke/indent-blankline.nvim" }
	use { "nvim-treesitter/nvim-treesitter",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
			{ "lewis6991/spellsitter.nvim" },
			{ "romgrk/nvim-treesitter-context" },
			{ "nvim-treesitter/playground" }
			-- ,
			-- {
			--     "haringsrob/nvim_context_vt",
			--     config = function()
			--         vim.api.nvim_set_hl(0, require('nvim_context_vt.config').default_opts.highlight, { fg = 0x505050 })
			--     end
			-- }
		} }
	use { 'lfv89/vim-interestingwords',
		opt = true,
		fn = "InterestingWords",
	}

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'  -- autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'jose-elias-alvarez/null-ls.nvim'
	use { 'folke/trouble.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

	-- FILE finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

	-- FAST edit
	use {
		'ggandor/leap.nvim'
	}
	use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }


	-- Git tools
	use { 'sindrets/diffview.nvim'
	}
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release'
	}
	use { 'folke/which-key.nvim' }

	-- WINDOW layout
	use { 'folke/zen-mode.nvim',
		config = function()
			require("zen-mode").setup {
				width = 0.85,
			}
		end,
		opt = true,
		cmd = "ZenMode",
	}

	-- nvim profile
	use { 'dstein64/vim-startuptime',
		opt = true,
		cmd = 'StartupTime',
		which_map = {
			v = {
				name = 'vim',
				s = { ':StartupTime<CR>', 'show start up time profile' }
			}
		}
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
