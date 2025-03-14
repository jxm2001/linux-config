return{
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{'nvim-telescope/telescope-fzf-native.nvim', build = "make" }
	},
	opts = {
	  defaults = {
		mappings = {
		  i = {
			["<C-j>"] = "preview_scrolling_down",
			["<C-k>"] = "preview_scrolling_up",
			["<C-d>"] = "delete_buffer",
		  },
		  n = {
			["q"] = "close",
			["<C-j>"] = "preview_scrolling_down",
			["<C-k>"] = "preview_scrolling_up",
			["<C-d>"] = "delete_buffer",
		  }
		}
	  },
	  pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	  },
	  extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	  }
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require('telescope').load_extension('fzf')
	end,
}
