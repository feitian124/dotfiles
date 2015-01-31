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

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set lines=999
    set columns=999
    set guifont=Ubuntu\ Mono\ 11
endif

syntax on " Enable syntax
set background=dark " Set background
colorscheme desert

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

call neobundle#end()

" Required:
filetype plugin indent on " Required!

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"============ CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" <C-L> open in buffer mode, then <C-K> and <C-J> to cycle
nnoremap <C-L> :CtrlPBuffer<CR>
