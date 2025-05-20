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
function! SmartCR() abort
  if &filetype ==# 'qf'
    return "\<CR>"
  else
    return "o\<Esc>"
  endif
endfunction

nnoremap <expr> <cr> SmartCR()

" 高亮搜索
set hlsearch
set incsearch
nnoremap <silent> <leader>n :nohlsearch<cr>

" 折叠设置
nnoremap <leader>w za 
nnoremap <leader>qi :set foldmethod=indent<cr>
nnoremap <leader>qe :set foldmethod=expr<cr>
set foldmethod=indent
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

" 读取 lua 配置
lua require('init')

" 文件树配置
nnoremap <leader>g :NvimTreeToggle<CR>
nnoremap <leader>v :NvimTreeFindFile<CR>

" 符号颜色显示
let g:rainbow_active = 1
