require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"cpp", "c", "cuda", "cmake", "bash", "vim", "python", "lua"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  -- 括号匹配
  rainbow = {
    enable = true,
    extended_mode = true,
	max_file_lines = nil
  },
}
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
