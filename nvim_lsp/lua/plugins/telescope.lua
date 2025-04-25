return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-[>"] = "close",
					["<C-c>"] = { "<esc>", type = "command" },
					["<C-k>"] = "preview_scrolling_up",
					["<C-j>"] = "preview_scrolling_down",
					["<C-h>"] = "preview_scrolling_left",
					["<C-l>"] = "preview_scrolling_right",
					["<C-d>"] = "delete_buffer",
				},
				n = {
					["q"] = "close",
					["<C-k>"] = "preview_scrolling_up",
					["<C-j>"] = "preview_scrolling_down",
					["<C-h>"] = "preview_scrolling_left",
					["<C-l>"] = "preview_scrolling_right",
					["<C-d>"] = "delete_buffer",
				},
			},
		},
		pickers = {
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
