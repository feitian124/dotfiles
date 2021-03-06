set encoding=utf-8
set mouse=a "let mouse work
set autoread " Set autoread when a file is changed outside
set number " Show line numbers

set showmatch " Show matching brackets/parenthesis
set matchtime=2 " Decrease the time to blink

set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=1 " Minimal number of columns to scroll horizontally
set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor

set expandtab " Convert all tabs typed to spaces
set tabstop=2 "  Force tabs to be displayed to 2 spaces
set softtabstop=2 " Indentation levels every 2 columns
set shiftwidth=2 " Indent/outdent by 2 columns
set shiftround " Indent/outdent to nearest tabstop

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set backspace=indent,eol,start  " Backspace for dummies
"set cursorline                  " Highlight current line
"set cursorcolumn                " Highlight current column
set showcmd                     " Show partial commands in status line and
set hlsearch                    " Highlight search terms

"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//

if has('gui_running')
  set guioptions-=m
  set guioptions-=T
  set lines=999
  set columns=999
  set guifont=Ubuntu\ Mono\ 11
endif

syntax on " Enable syntax

let mapleader=',' " Change the mapleader
" Keep the cursor in place while joining lines
nnoremap J mzJ`z
" Strip all trailing whitespace in the current file
nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>

" Source the vimrc file after saving it
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost $MYVIMRC NeoBundleClean
" Fast edit the .vimrc file using ,x
nnoremap <Leader>x :edit $MYVIMRC<CR>
nnoremap <C-J> :bp<CR>
nnoremap <C-K> :bn<CR>
nnoremap <C-D> :bd<CR>
nnoremap <C-E> :NERDTreeToggle<CR>

"--------------------------------------------------
" => NeoBundle
"--------------------------------------------------

if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Use NeoBundle to manager plugins
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kien/ctrlp.vim' " find files
NeoBundle 'scrooloose/nerdtree' " NERD tree
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'Raimondi/delimitMate'
call neobundle#end()

" Required:
filetype plugin indent on " Required!

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" CtrlP ===========================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip
" <C-L> open in buffer mode, then <C-K> and <C-J> to cycle
nnoremap <C-L> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
