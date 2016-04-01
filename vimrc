" vim {{{
" vim:foldmethod=marker:foldlevel=0
set nocompatible
" }}}
" vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'hdima/python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'w0ng/vim-hybrid'
call vundle#end()
filetype plugin indent on
" plugin settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let python_highlight_all = 1
" }}}
" system {{{
set hidden                     " hide files with unsaved changes
set history=1000               " keep 1000 lines of command history
set undolevels=1000            " more undo
set mouse=a                    " use mouse in visual mode
set confirm                    " get a dialog when :q, :w, or :wq fails
set nobackup                   " no backup~ files.
set noswapfile                 " use git
set undofile                   " keep undo history after quitting
set undodir=~/.vim/undo        " store undo files in ~/.vim/undo
set autochdir                  " cd to the directory fo file
" }}}
" editor {{{
set backspace=indent,eol,start " allow backspacing
set pastetoggle=<F2>           " F2 to enable paste
" escape timeout
set timeoutlen=1000
set ttimeoutlen=0
" }}}
" colors {{{
syntax enable                  " enable syntax highlighting
set background=dark            " enable for dark terminals
let g:hybrid_reduced_contrast = 1
colorscheme hybrid              " precision colors for machines and people
" }}}
" spaces & tabs {{{
set tabstop=4                  " spaces per tab
set softtabstop=4              " spaces per tab when editing
set expandtab                  " tabs are spaces
set shiftwidth=4               " number of spaces for autoindenting
set shiftround                 " use multiple of shiftwidth when indenting with '<' and '>'
" }}}
" visual {{{
set number relativenumber      " show line numbers
set lazyredraw                 " no redraw during macros
set scrolloff=2                " 2 lines above/below cursor when scrolling
set nowrap                     " do not wrap lines
" status line
set showmode                   " mode
set showcmd                    " command
set ruler                      " cursor position
" show matching bracket for 0.2 seconds
set showmatch
set matchtime=2
" completion menu
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
" highlight trailing whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" don't beep
set visualbell
set noerrorbells
" }}}
" searching {{{
set incsearch                  " show search matches as you type
set hlsearch                   " highlight search terms
set ignorecase                 " case insensitive searching
set smartcase                  " but become case sensitive if you type uppercase characters
set magic                      " change the way backslashes are used in search patterns
" }}}
" folding {{{
set foldenable                 " enable folding
set foldlevelstart=10          " open some folds by default
set foldnestmax=10             " nested fold max
set foldmethod=indent          " fold on indent
" open/close folds
nnoremap <space> za
" }}}
" movement {{{
" visual lines
nnoremap j gj
nnoremap k gk
" }}}
" leader shortcuts {{{
let mapleader=","
" edit/reload the vimrc file
nnoremap <silent> <leader>, :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" buffers
nnoremap <silent> <leader>l :ls<CR>:b<Space>
" toggle comment
map <silent> <leader>/ gcc
" global replace
nnoremap <silent> <leader>g :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <leader>G :%s/\<<C-r><C-W>\>//g<Left><Left>
" toggle line numbers
nnoremap <silent> <leader>n :call ToggleNumber()<CR>
" clear search highlights
nnoremap <silent> <leader>. :nohlsearch<CR>
" }}}
" mappings {{{
nnoremap ; :
nnoremap : ;
" diasble arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" end-of-line yank
nnoremap Y y$
" buffers
map <S-Up> ;e<Space>
map <S-Down> ;bd<CR>
map <S-Left> ;bprevious<CR>
map <S-Right> ;bnext<CR>
" tabs
map <C-Left> <Esc>;tabprev<CR>
map <C-Right> <Esc>;tabnext<CR>
map <C-Up> <Esc>;tabe<Space>
" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" auto indent on paste
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
" post factum sudo vim
cmap w!! w !sudo tee % >/dev/null
" }}}
" autogroups {{{
augroup vimrc
    autocmd filetype html,xml set listchars-=tab:>. smartindent smarttab softtabstop=4 shiftwidth=4 expandtab
    autocmd filetype javascript set smartindent smarttab softtabstop=4 shiftwidth=4 expandtab
    autocmd filetype javascript abbreviate csl console.log();<Esc>hi
    autocmd filetype javascript execute "set colorcolumn=" . join(range(101,355), ',')
    autocmd filetype javascript highlight ColorColumn ctermbg=0
    autocmd filetype python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
    autocmd filetype python abbreviate pr print
    autocmd filetype python execute "set colorcolumn=" . join(range(161,415), ',')
    autocmd filetype python highlight ColorColumn ctermbg=0
augroup END
" }}}
" functions {{{
" toggle between actual and relative line numbers
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction
" }}}
" about {{{
" vimrc
" Brandon Freitag, 2015
" Ideas borrowed from 'A Good Vimrc' by Doug Black
" http://dougblack.io/words/a-good-vimrc.html#colors
" }}}
