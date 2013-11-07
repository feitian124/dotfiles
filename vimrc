set nocompatible                " be iMproved
filetype off                    " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'
" My Bundles here:
Bundle 'Align'
Bundle 'tpope/vim-rails'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hallison/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'kien/ctrlp.vim'
"Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
filetype plugin indent on       "根据文件格式载入插件和缩进

set guifont=monaco\ 10          " 字体
set nobackup
set nowritebackup
set noswapfile                  " No Swap Files
set ruler                       " Show line and column number
set showcmd
set showmatch                   " show matching brackets
set wildmenu                    "打开命令行补全菜单
set number                      "显示行号
set incsearch                   "马上跳到搜索匹配
set autoindent
set encoding=utf-8
set mouse=a                     "打开鼠标功能
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cursorcolumn
" Display extra whitespace
set list listchars=tab:▸\ ,trail:▫
syntax on                       "语法高亮
colorscheme desert

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd VimEnter * if !argc() | NERDTree | endif

nmap <Up> <c-w>k
nmap <Down> <c-w>j
nmap <Right> <c-w>l
nmap <Left> <c-w>h

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }
