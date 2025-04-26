return {
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
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
			run_on_start = true,
			auto_update = false,
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"saghen/blink.cmp",
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

			cmdline = { enabled = false },

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
