return {
	url = "https://codeberg.org/andyg/leap.nvim",
	config = function ()
		require('leap').opts.safe_labels = {}
	end,
	lazy = false
}
