return{
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			local langs = {
				"cpp",
				"c",
				"cuda",
				"cmake",
				"bash",
				"vim",
				"python",
				"lua",
				"markdown",
				"markdown_inline",
				"fortran",
			}

			ts.install(langs)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("my_treesitter", { clear = true }),
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
					if not lang or lang == "" then
						return
					end
					pcall(vim.treesitter.start, args.buf, lang)
					if vim.treesitter.query.get(lang, "indents") then
						vim.bo[args.buf].indentexpr =
							"v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
		lazy = false,
	},
	{ 'HiPhish/rainbow-delimiters.nvim', lazy = false },
}
