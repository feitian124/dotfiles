" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" BundleInstall

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
Bundle 'scrooloose/syntastic'

set guifont=monaco\ 10          " 字体
set nobackup
set nowritebackup

syntax on                       "语法高亮
colorscheme desert
set wildmenu                    "打开命令行补全菜单
set vb t_vb=                    "关闭响铃，闪屏
set number                      "显示行号
set incsearch                   "马上跳到搜索匹配
filetype plugin indent on       "根据文件格式载入插件和缩进
set autoindent
set encoding=utf-8
set mouse=a                     "打开鼠标功能
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cursorcolumn
" Display extra whitespace
" set list listchars=tab:»·,trail:·
set list listchars=tab:▸\ ,trail:▫

autocmd FileType make             set noexpandtab
autocmd FileType python           set noexpandtab
autocmd FileType css,scss         set tabstop=2 shiftwidth=2
autocmd FileType ruby,rdoc        set tabstop=2 shiftwidth=2
autocmd FileType html             set tabstop=2 shiftwidth=2
autocmd FileType javascript       set tabstop=2 shiftwidth=2
autocmd FileType coffee           set tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.slim set filetype=slim

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" 快捷键
nmap <Up> <c-w>k
nmap <Down> <c-w>j
nmap <Right> <c-w>l
nmap <Left> <c-w>h

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

nmap <F2> :w<cr>
nmap <F3> :wa<cr>
nmap <F4> :q<cr>
nmap <F6> :cp<cr>
nmap <F7> :cn<cr>
nmap <F11> gg=G<C-o>

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

nmap <A-up> :lprev<cr>
nmap <A-down> :lnext<cr>
nmap <A-right> :ll<cr>

