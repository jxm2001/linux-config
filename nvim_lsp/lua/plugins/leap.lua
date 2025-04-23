return {
	'ggandor/leap.nvim',
	config = function ()
		require('leap').opts.safe_labels = {}
	end,
	lazy = false
}
