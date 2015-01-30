set nocompatible " Get out of vi compatible mode
set timeoutlen=500 " Time to wait for a command
set mouse=a "let mouse work
set smarttab
set autoread " Set autoread when a file is changed outside
set autowrite " Write on make/shell commands
set hidden " Turn on hidden"
set history=1000 " Increase the lines of history
set clipboard+=unnamed " Yanks go on clipboard instead
set modeline " Turn on modeline
set encoding=utf-8 " Set utf-8 encoding
set completeopt+=longest " Optimize auto complete
set completeopt-=preview " Optimize auto complete
set backup " Set backup
set undofile " Set undo

filetype plugin indent on " Enable filetype
let mapleader=',' " Change the mapleader
let maplocalleader='\' " Change the maplocalleader

" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost $MYVIMRC NeoBundleClean
" Fast edit the .vimrc file using ,x
nnoremap <Leader>x :edit $MYVIMRC<CR>

"--------------------------------------------------
" => NeoBundle
"--------------------------------------------------

if has('vim_starting')
    set nocompatible
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand($HOME . '/.vim/bundle/'))

" Use NeoBundle to manager plugins
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kien/ctrlp.vim' " find files
NeoBundle 'scrooloose/nerdtree' " NERD tree

filetype plugin indent on " Required!

NeoBundleCheck

set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

set number " Show line numbers
set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink

set textwidth=80 " Change text width

set list " Show these tabs and spaces and so on
set listchars=tab:▸\ ,eol:¬
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break
set fillchars=diff:⣿,vert:│ " Change fillchars

    augroup trailing " Only show trailing whitespace when not in insert mode
        autocmd!
        autocmd InsertEnter * :set listchars-=trail:⌴
        autocmd InsertLeave * :set listchars+=trail:⌴
    augroup END

" Set gVim UI setting
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set lines=999
    set columns=999
    set guifont=DejaVu\ Sans\ Mono\ 11
    "set guifont=DejaVu\ Sans\ Mono:h11
endif

syntax on " Enable syntax
set background=dark " Set background
colorscheme desert


set expandtab " Convert all tabs typed to spaces
set softtabstop=2 " Indentation levels every four columns
set shiftwidth=2 " Indent/outdent by four columns

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>
