" 设置行号
set number

" 设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 映射配置
let mapleader=','

" 普通模式下配置
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <cr> o<Esc>

" 折叠设置
set foldmethod=indent
nnoremap <leader>w za 
set foldlevel=9

" 插件配置

" 设置标签页主题
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dark'

" 缩进字符
let g:indentLine_char='┆'

" 主题颜色
set rtp+=~/.vim/plugged/vim-solarized8
syntax enable
set background=dark
colorscheme solarized8_high 

" 文件树配置
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore= ['\.git$','\.swp$']
" 当 NERDTree 是最后一个缓冲区时自动退出
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" 禁止其他窗口替换 NERDTree 窗口 
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" 文件搜索插件配置 
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'

" 快速跳转
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>F <Plug>(easymotion-overwin-f2)
nmap  / <Plug>(easymotion-sn)
nmap  n <Plug>(easymotion-next)
nmap  N <Plug>(easymotion-prev)
nmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline=0

" 文本替换设置
let g:far#enable_undo=1

" which-key 配置
nnoremap <silent> <leader> :WhichKey ','<CR>

" c++ 高亮配置
let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" 补全设置
let g:deoplete#enable_at_startup = 1

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'brooth/far.vim'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'octol/vim-cpp-enhanced-highlight'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()
