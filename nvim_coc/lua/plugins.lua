-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
	function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'mhinz/vim-startify'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'
	}
	use "lukas-reineke/indent-blankline.nvim"
	use 'rebelot/kanagawa.nvim'
	use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }
	use 'ggandor/leap.nvim'
	use 'tpope/vim-surround'
	use 'brooth/far.vim'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use {
		"folke/which-key.nvim",
		config = function() require("which-key").setup {} end
	}
	use 'ludovicchabant/vim-gutentags'
	use 'tpope/vim-fugitive'
	use 'ojroques/vim-oscyank'
	use { 'neoclide/coc.nvim', branch = 'release' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
	}
	use 'HiPhish/rainbow-delimiters.nvim'
	use 'lewis6991/impatient.nvim'
end
)
