return {
	{
		"uhs-robert/oasis.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oasis").setup()
			vim.cmd.colorscheme("oasis")
		end
	},
	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {options = {theme = "oasis"}},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
