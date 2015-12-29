
" This must be first, because it changes other options as side effect
set nocompatible
filetype off " Vundle

" Use Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on " Vundle

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
set ts=4 sw=4 et
let g:indent_quides_start_level = 2
let g:indent_guides_guide_size = 1

let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Editor Settings
set hidden
set backspace=indent,eol,start
set autoindent
set copyindent
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set noerrorbells
set nobackup
set noswapfile

" Display Settings
set background=dark " dark terminal
set number " line numbers
set nowrap " dont wrap lines
set scrolloff=2  " 2 lines above/below cursor when scrolling
set showmatch  "show matching bracket (briefly jump)
set showmode " show mode in status bar (insert/replace/...)
set showcmd " show command in status bar
set ruler " show cursor position in status bar
set title " show file in titlebar
set wildmenu " completion menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2 " 2 lines for the status bar
set matchtime=2  " show matching bracket for 0.2 seconds
set matchpairs+=<:> " html
set t_Co=256
syntax on

autocmd filetype html,xml set listchars-=tab:>.

colorscheme solarized

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

set mouse=a

nnoremap ; :

vmap Q gq
nmap Q gqap

imap <C-c> <CR><Esc>O

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" mappings
map <silent> <leader>l oconsole.log('debug');<Esc>
" Switch tabs
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-Up> <Esc>:tabe 
" end of line
" noremap <C-e> A
" vnoremap <C-e> <C-c>A
" inoremap <C-e> <C-o>A
" beginning of line
" noremap <C-a> I
" vnoremap <C-a> <C-c>I
" inoremap <C-a> <C-o>I
" Save file
noremap <C-S> :update<CR>
inoremap <C-S> <C-o>:update<CR>
vnoremap <C-S> <C-c>:update<CR>
" Copy/Paste
noremap <C-x> ddkp
inoremap <C-x> <C-o>dd<C-o>k<C-o>p
vnoremap <C-x> <C-c>dd<C-c>k<C-c>p
noremap <C-p> p
inoremap <C-p> <C-o>p
vnoremap <C-p> <C-c>p
" cr expand
inoremap <C-z> <CR><C-o>k<C-o>o

" nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>. :nohlsearch<CR>
nmap <silent> <leader>/ gcc
nmap <silent> <leader>m :lclose<CR><CR>
" nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <leader>n <plug>NERDTreeTabsToggle<CR>

let python_highlight_all = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let delimitMate_expand_cr = 1
let g:nerdtree_tabs_open_on_console_startup = 1

cmap w!! w !sudo tee % >/dev/null
