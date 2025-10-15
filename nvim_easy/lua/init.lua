-- OSC 52 clipboard config
if pcall(require, "vim.ui.clipboard.osc52") then
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
		},
	}
end

require("config.lazy")
vim.keymap.set({'n'}, 'L',  '<cmd>Lazy<cr>')

-- leap config
vim.keymap.set({'n', 'x', 'o'}, 'e',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'E',  '<Plug>(leap-backward)')

-- bufferline config
vim.keymap.set('n', 'gp', '<cmd>BufferLinePick<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g1', '<cmd>lua require("bufferline").go_to(1, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g2', '<cmd>lua require("bufferline").go_to(2, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g3', '<cmd>lua require("bufferline").go_to(3, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g4', '<cmd>lua require("bufferline").go_to(4, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g5', '<cmd>lua require("bufferline").go_to(5, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g6', '<cmd>lua require("bufferline").go_to(6, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g7', '<cmd>lua require("bufferline").go_to(7, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g8', '<cmd>lua require("bufferline").go_to(8, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g9', '<cmd>lua require("bufferline").go_to(9, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'g$', '<cmd>lua require("bufferline").go_to(-1, true)<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', '<cmd>BufferLinePickClose<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { noremap = true, silent = true })

-- Gitsigns config
vim.keymap.set("n", "gs", "<cmd>Gitsigns preview_hunk<cr>", { desc = "git preview hunk" })
vim.keymap.set("n", "[g", "<cmd>Gitsigns nav_hunk prev<cr>", { desc = "git navigate hunk prev" })
vim.keymap.set("n", "]g", "<cmd>Gitsigns nav_hunk next<cr>", { desc = "git navigate hunk next" })
vim.keymap.set("n", "<leader>Gb", "<cmd>Gitsigns blame<cr>", { desc = "git blame" })
vim.keymap.set("n", "<leader>Gd", "<cmd>Gitsigns diffthis<cr>", { desc = "git diff HEAD" })
vim.keymap.set("n", "<leader>GD", "<cmd>Gitsigns diffthis ~<cr>", { desc = "git diff HEAD^" })
