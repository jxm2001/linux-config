return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
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
			pickers = {},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
	keys = {
		{ '<c-p>', '<cmd>Telescope find_files<cr>', desc = 'Telescope find files' },
		{ '<leader>pg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live grep' },
		{ '<leader>pb', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers' },
		{ '<leader>ph', '<cmd>Telescope help_tags<cr>', desc = 'Telescope help tags' },
		{ '<leader>pm', '<cmd>Telescope oldfiles<cr>', desc = 'Telescope mru' },
		{ '<leader>pt', '<cmd>Telescope tags<cr>', desc = 'Telescope tags' },
		{ '<leader>pf', '<cmd>Telescope filetypes<cr>', desc = 'Telescope filetypes' },
	}
}
