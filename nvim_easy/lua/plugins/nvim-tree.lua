return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			update_focused_file = {
				enable = true,
				update_root = {
					enable = true
				}
			},
			git = {
				enable = false
			}
		}
	end,
	event = "VeryLazy"
}
