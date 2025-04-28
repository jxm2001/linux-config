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

			vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover({ border = 'rounded' })<CR>", opts)
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
			vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
			vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", opts)
			vim.keymap.set("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<cr>", opts)
			vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
			vim.keymap.set({ "n", "x" }, "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			vim.keymap.set("n", "<leader>rn", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { desc = "rename", buffer = bufnr, expr = true })
		end,
	}
	if server == "fortls" then
		config.cmd = {
			"fortls",
			-- "--notify_init",
			"--hover_signature",
			"--hover_language=fortran",
			"--use_signature_help",
		}
	end
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

vim.keymap.set({ "n", "x" }, "<leader>f", function()
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
vim.keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame<cr>", { desc = "git blame" })
vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<cr>", { desc = "git diff HEAD" })
vim.keymap.set("n", "<leader>hD", "<cmd>Gitsigns diffthis ~<cr>", { desc = "git diff HEAD^" })

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
