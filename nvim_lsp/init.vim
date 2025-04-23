" 映射配置
let mapleader=' '

" 禁用鼠标
set mouse=

" 设置行号
set number

" 高亮当前行
set cursorline

" 自动换行
set wrap

" 显示输入
set showcmd

" 显示候选命令
set wildmenu

" 设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 快速移动
nnoremap <C-h> 5h
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-l> 5l
vnoremap <C-h> 5h
vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-l> 5l

" 快速换行
nnoremap <cr> o<Esc>

" 高亮搜索
set hlsearch
set incsearch
nnoremap <silent> <leader>n :nohlsearch<cr>

" 折叠设置
nnoremap <leader>w za 
nnoremap <leader>qi :set foldmethod=indent<cr>
nnoremap <leader>qe :set foldmethod=expr<cr>
set foldmethod=expr
set foldlevel=99

" terminal mode 配置
tnoremap <C-[> <C-\><C-N>
nnoremap <leader>t :terminal<CR>
" 创建终端时自动进入插入模式
autocmd TermOpen * startinsert
" 进入已经存在的终端时自动进入插入模式
" autocmd BufEnter term://* startinsert

" 兼容 msys2 shell
if has("win32")
	let &shellcmdflag='-c'
	set shellxquote=(
	set shellslash
endif

" 状态列集成
set signcolumn=yes

" 允许跳转时有未保存的文件
set hidden

" 终端真彩色
set termguicolors

" 插件配置

" 读取 lua 配置
lua require('init')

" bufferline 配置
nnoremap <silent> gp :BufferLinePick<CR>
nnoremap <silent> g1 <cmd>lua require("bufferline").go_to(1, true)<CR>
nnoremap <silent> g2 <cmd>lua require("bufferline").go_to(2, true)<CR>
nnoremap <silent> g3 <cmd>lua require("bufferline").go_to(3, true)<CR>
nnoremap <silent> g4 <cmd>lua require("bufferline").go_to(4, true)<CR>
nnoremap <silent> g5 <cmd>lua require("bufferline").go_to(5, true)<CR>
nnoremap <silent> g6 <cmd>lua require("bufferline").go_to(6, true)<CR>
nnoremap <silent> g7 <cmd>lua require("bufferline").go_to(7, true)<CR>
nnoremap <silent> g8 <cmd>lua require("bufferline").go_to(8, true)<CR>
nnoremap <silent> g9 <cmd>lua require("bufferline").go_to(9, true)<CR>
nnoremap <silent> g$ <cmd>lua require("bufferline").go_to(-1, true)<CR>
nnoremap <silent> gD :BufferLinePickClose<CR>
nnoremap <silent> [b :BufferLineCyclePrev<CR>
nnoremap <silent> ]b :BufferLineCycleNext<CR>
nnoremap <silent> <leader>bh :BufferLineCloseLeft<CR>
nnoremap <silent> <leader>bl :BufferLineCloseRight<CR>
nnoremap <silent> <leader>bo :BufferLineCloseOthers<CR>

" 文本替换设置
let g:far#enable_undo=1

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
