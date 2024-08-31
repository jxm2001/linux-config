return {
	'ggandor/leap.nvim',
	config = function () 
		require('leap')
		require('leap').opts.safe_labels = {}
		require('leap').opts.highlight_unlabeled_phase_one_targets = true
		require('leap').opts.special_keys = {
			repeat_search = '<enter>',
			next_phase_one_target = '<enter>',
			next_target = ';',
			prev_target = ',',
			next_group = '<space>',
			prev_group = '<tab>',
			multi_accept = '<enter>',
			multi_revert = '<backspace>',
		}
	end,
	event = "VeryLazy"
}
