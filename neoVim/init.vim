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
nnoremap <A-h> 5h
nnoremap <A-j> 5j
nnoremap <A-k> 5k
nnoremap <A-l> 5l

" 窗口切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 折叠设置
nnoremap <leader>w za 
nnoremap <leader>qi :set foldmethod=indent<cr>
nnoremap <leader>qe :set foldmethod=expr<cr>
set foldmethod=expr
set foldlevel=99

" 快速换行
nnoremap <cr> o<Esc>

" terminal mode 配置
tnoremap <Esc> <C-\><C-N>
tnoremap <C-[> <C-\><C-N>
nnoremap <leader>t :terminal<CR>
" 创建终端时自动进入插入模式
autocmd TermOpen * startinsert
" 进入已经存在的终端时自动进入插入模式
autocmd BufEnter term://* startinsert

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
nnoremap <silent> <leader>y :OSCYankReg "<CR>
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gh :call ShowDocumentation()<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>s  <Plug>(coc-format-selected)
nmap <leader>s  <Plug>(coc-format-selected)
" 状态列集成
set signcolumn=yes
" 允许跳转时有未保存的文件
set hidden
