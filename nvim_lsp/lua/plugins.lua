return {
	-- the colorscheme should be available when starting Neovim
	{
		'rebelot/kanagawa.nvim',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'echasnovski/mini.icons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	{ 'brooth/far.vim', event = "VeryLazy" },
	{
		'numToStr/Comment.nvim',
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{ 'ludovicchabant/vim-gutentags', event = "VeryLazy" },
	{ 'tpope/vim-fugitive', event = "VeryLazy" },
}
