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

-- lsp config
vim.keymap.del('n', 'grn')
vim.keymap.del({'n', 'v'}, 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
for _, server in ipairs({ "clangd", "cmake", "pyright", "bashls", "lua_ls", "vimls", "dockerls",
	"docker_compose_language_service", "marksman", "biome", "yamlls", "fortls" }) do
	local config = {
		on_attach = function(client, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
			vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
			vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			vim.keymap.set("n", "<leader>rn", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { buffer = bufnr, expr = true })
		end,
	}
	vim.lsp.enable(server)
	vim.lsp.config(server, config)
end

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "● ",
	},
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

vim.keymap.set({ "n", "x" }, "<leader>s", function()
	require("conform").format({ async = true }, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-[>", true, false, true), "n", true)
			end
		end
	end)
end, { desc = "format code" })

-- leap config
vim.keymap.set({'n', 'x', 'o'}, 'e',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'E',  '<Plug>(leap-backward)')

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>pm', builtin.oldfiles, { desc = 'Telescope mru' })
vim.keymap.set('n', '<leader>pt', builtin.tags, { desc = 'Telescope tags' })
vim.keymap.set('n', '<leader>pf', builtin.filetypes, { desc = 'Telescope filetypes' })

-- bufferline config
vim.keymap.set('n', 'gp', '<cmd>BufferLinePick<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g1', '<cmd>lua require("bufferline").go_to(1, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g2', '<cmd>lua require("bufferline").go_to(2, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g3', '<cmd>lua require("bufferline").go_to(3, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g4', '<cmd>lua require("bufferline").go_to(4, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g5', '<cmd>lua require("bufferline").go_to(5, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g6', '<cmd>lua require("bufferline").go_to(6, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g7', '<cmd>lua require("bufferline").go_to(7, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g8', '<cmd>lua require("bufferline").go_to(8, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g9', '<cmd>lua require("bufferline").go_to(9, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'g$', '<cmd>lua require("bufferline").go_to(-1, true)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', '<cmd>BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { noremap = true, silent = true })

-- Gitsigns config
vim.keymap.set("n", "gs", "<cmd>Gitsigns preview_hunk<cr>", { desc = "git preview hunk" })
vim.keymap.set("n", "[g", "<cmd>Gitsigns nav_hunk prev<cr>", { desc = "git navigate hunk prev" })
vim.keymap.set("n", "]g", "<cmd>Gitsigns nav_hunk next<cr>", { desc = "git navigate hunk next" })

-- nvim_treesitter config
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}
