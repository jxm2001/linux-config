require('leap')
require('leap').opts.safe_labels = {}
require('leap').opts.highlight_unlabeled_phase_one_targets = true
require('leap').opts.special_keys = {
	repeat_search = '<enter>',
	next_phase_one_target = '<enter>',
	next_target = 'n',
	prev_target = 'N',
	next_group = '<space>',
	prev_group = '<tab>',
	multi_accept = '<enter>',
	multi_revert = '<backspace>',
}
vim.keymap.set({'x', 'o', 'n'}, 'e', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'E', '<Plug>(leap-backward-to)')
