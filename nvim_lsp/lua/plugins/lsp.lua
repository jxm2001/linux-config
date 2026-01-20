return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- vim.lsp.buf.code_action()
			vim.keymap.del({'n', 'v'}, 'gra')
			-- vim.lsp.buf.implementation()
			vim.keymap.del('n', 'gri')
			-- vim.lsp.buf.rename()
			vim.keymap.del('n', 'grn')
			-- vim.lsp.buf.references()
			vim.keymap.del('n', 'grr')
			-- vim.lsp.buf.type_definition()
			vim.keymap.del('n', 'grt')
			-- vim.lsp.buf.document_symbol()
			vim.keymap.del('n', 'gO')
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
		end,
	},
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason-org/mason.nvim" },
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = {
			"MasonToolsClean",
			"MasonToolsInstall",
			"MasonToolsInstallSync",
			"MasonToolsUpdate",
			"MasonToolsUpdateSync",
		},
		build = ":MasonToolsInstall",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				"clangd",
				"cmake",
				"pyright",
				"bashls",
				"lua_ls",
				"vimls",
				"dockerls",
				"docker_compose_language_service",
				"marksman",
				"yamlls",
				"biome",
				"fortls",
				"clang-format",
				"ruff",
				"beautysh",
				"stylua",
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "default",
				["<C-space>"] = {},
				["<Tab>"] = {},
				["<S-Tab>"] = {},
				["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
				["<C-j>"] = { "snippet_forward", "fallback" },
				["<C-k>"] = { "snippet_backward", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				list = { selection = { preselect = false, auto_insert = true } },
				documentation = { auto_show = true },
			},

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
					},
				},
			},

			cmdline = {
				enabled = true,
				completion = {
					list = { selection = { preselect = false, auto_insert = true } },
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"smjonas/inc-rename.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "ruff_format" },
				bash = { "beautysh" },
				json = { "biome" },
				["*"] = { "trim_whitespace" },
			},
		},
	},
}
