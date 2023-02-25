" 映射配置
let mapleader=' '

" 禁用鼠标
set mouse=

" 设置行号
set number

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

" 插件配置

" 激活插件
lua require('plugins')
lua require('plugins/impatient')
lua require('plugins/nvim-tree')
lua require('plugins/leap')
lua require('plugins/bufferline')
lua require('plugins/lualine')
lua require('plugins/indent-blankline')

" 主题颜色
set termguicolors
colorscheme kanagawa

" 文件树配置
nnoremap <leader>g :NvimTreeToggle<CR>
nnoremap <leader>v :NvimTreeFindFile<CR>

" bufferline 配置
nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <silent> g1 :BufferLineGoToBuffer 1<CR>
nnoremap <silent> g2 :BufferLineGoToBuffer 2<CR>
nnoremap <silent> g3 :BufferLineGoToBuffer 3<CR>
nnoremap <silent> g4 :BufferLineGoToBuffer 4<CR>
nnoremap <silent> g5 :BufferLineGoToBuffer 5<CR>
nnoremap <silent> g6 :BufferLineGoToBuffer 6<CR>
nnoremap <silent> g7 :BufferLineGoToBuffer 7<CR>
nnoremap <silent> g8 :BufferLineGoToBuffer 8<CR>
nnoremap <silent> g9 :BufferLineGoToBuffer 9<CR>

" LeaderF 配置
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" shortcut
let g:Lf_ShortcutF = "<c-p>"
nnoremap <leader>pf :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
nnoremap <leader>pt :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
nnoremap <leader>pb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
nnoremap <leader>pm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
nnoremap <leader>pl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>pp :<C-U><C-R>=printf("Leaderf filetype %s", "")<CR><CR>

" 文本替换设置
let g:far#enable_undo=1

" oscyank 配置
nnoremap <silent> <leader>y :OSCYankReg "<CR>
let g:oscyank_term = 'default'
