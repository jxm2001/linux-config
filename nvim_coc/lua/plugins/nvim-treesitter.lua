return{
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "cpp", "c", "cuda", "cmake", "bash", "vim", "python", "lua" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end,
		lazy = false
	},
	{ 'HiPhish/rainbow-delimiters.nvim', lazy = false },
}
