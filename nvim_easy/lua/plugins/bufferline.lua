return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require("bufferline").setup {
			options = {
				tab_size = 0,
				offsets = {{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left"
				}},
				numbers = "ordinal",
				show_buffer_close_icons = false,
				show_close_icon = false
			},
		}
	end,
	lazy = false
}
