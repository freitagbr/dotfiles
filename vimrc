" This must be first, because it changes other options as side effect
set nocompatible
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdTree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on

let g:airline_powerline_fonts = 1    " powerline fonts
let g:airline#extensions#tabline#enabled = 1    " airline tabs
let g:syntastic_javascript_checkers = ['standard']    " synstastic javascript

" Visual
syntax enable           " enable syntax highlighting
set background=dark     " enable for dark terminals
colorscheme solarized   " precision colors for machines and people
set nowrap              " don't wrap lines
set scrolloff=2         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set hlsearch            " highlight search terms
set incsearch           " show search matches as you type
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set visualbell          " don't beep
set noerrorbells        " don't beep

" Editor
set hidden              " hide files with unsaved changes
set nowrap              " don't wrap lines
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set tabstop=4           " 4 spaces per tab
set shiftwidth=4        " 4 spaces per autoindent
set shiftround          " multiples of shiftwidth when indenting with '<' and '>'
set expandtab           " convert tabs to spaces
set magic               " change the way backslashes are used in search patterns
set backspace=indent,eol,start    " backspacing over everything in insert mode
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>

" System
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=1000        " keep 1000 lines of command history
set undolevels=1000     " more undo
set mouse=a             " use mouse in visual mode
set nobackup            " use git
set noswapfile          " use git

let mapleader=","       " change the mapleader from \ to ,

" mappings
map <silent> <leader>l oconsole.log('debug');<Esc>
" edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" clear search highlights
nmap <silent> ,/ :nohlsearch<CR>
" tab shortcuts
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-Up> <Esc>:tabe<Space>
" vertical split
map <C-i> <Esc>:vsp<Space>
" end of line
noremap <C-e> A
vnoremap <C-e> <C-c>A
inoremap <C-e> <C-o>A
" beginning of line
noremap <C-a> I
vnoremap <C-a> <C-c>I
inoremap <C-a> <C-o>I
" cr expand
inoremap <C-l> <CR><C-o>k<C-o>o

autocmd filetype html,xml set listchars-=tab:>. smartindent smarttab softtabstop=2 shiftwidth=2 expandtab
autocmd filetype javascript set smartindent smarttab softtabstop=2 shiftwidth=2 expandtab

nnoremap ; :

cmap w!! w !sudo tee % >/dev/null
