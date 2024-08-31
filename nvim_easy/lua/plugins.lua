return {
	-- the colorscheme should be available when starting Neovim
    {
		'rebelot/kanagawa.nvim',
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme kanagawa]])
		end,
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
	},
    { 'mhinz/vim-startify', lazy = false },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup {}
        end,
        lazy = false
    },
    {
        'Yggdroot/LeaderF',
        build = ':LeaderfInstallCExtension',
		event = "VeryLazy"
    },
    { 'tpope/vim-surround', event = "VeryLazy" },
    { 'brooth/far.vim', event = "VeryLazy" },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {}
        end,
         event = "VeryLazy"
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end,
		event = "VeryLazy"
    },
    { 'airblade/vim-gitgutter', lazy = false },
    { 'tpope/vim-fugitive', event = "VeryLazy" },
    { 'luochen1990/rainbow', lazy = false },
}
