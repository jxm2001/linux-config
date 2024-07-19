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

" 插件配置

" 激活插件
lua require('plugins')
lua require('plugins/impatient')
lua require('plugins/nvim-tree')
lua require('plugins/leap')
lua require('plugins/bufferline')
lua require('plugins/lualine')
lua require('plugins/indent-blankline')
lua require('plugins/nvim-treesitter')
lua require('plugins/Comment')

" 主题颜色
set termguicolors
colorscheme kanagawa

" 文件树配置
nnoremap <leader>g :NvimTreeToggle<CR>
nnoremap <leader>v :NvimTreeFindFile<CR>

" bufferline 配置
nnoremap <silent> gp :BufferLinePick<CR>
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

" oscyank 配置
nnoremap <silent> <leader>y :OSCYankRegister "<CR>
let g:oscyank_term = 'default'

" coc
let g:coc_global_extensions = [
			\'coc-marketplace',
			\'coc-vimlsp',
			\'coc-json',
			\'coc-clangd',
			\'coc-cmake',
			\'coc-git',
			\'coc-sh',
			\'coc-jedi',
			\'coc-snippets',
			\'coc-docker']
" 诊断信息跳转
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" git 跳转
nmap <silent> [g <Plug>(coc-git-prevchunk)
nmap <silent> ]g <Plug>(coc-git-nextchunk)
nmap <silent> gs <Plug>(coc-git-chunkinfo)
" 定义引用跳转
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 帮助文档
nnoremap <silent> gh :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gh', 'in')
  endif
endfunction
" 补全确认
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 重命名
nmap <leader>rn <Plug>(coc-rename)
" 代码格式化
xmap <leader>s  <Plug>(coc-format-selected)
nmap <leader>s  <Plug>(coc-format-selected)
" 浮动窗口翻页
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
