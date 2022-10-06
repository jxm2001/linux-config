vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
		diagnostics = "coc",
		numbers = "buffer_id",
		tab_size = 0,
		offsets = {{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
		}},
		show_buffer_close_icons = false,
		show_close_icon = false
	}
}
