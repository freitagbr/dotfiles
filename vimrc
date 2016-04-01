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
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-commentary'
Plugin 'w0ng/vim-hybrid'
call vundle#end()
filetype plugin indent on
" plugin settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:hybrid_custom_term_colors = 1
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
set ttimeout                   " exit mode quickly
" }}}
" spaces {{{
set smartindent                " indent on new line
set smarttab                   " indent with spaces
set softtabstop=2              " number of spaces per tab
set shiftwidth=2               " number of spaces per indent
set expandtab                  " expand tabs in insert mode
" }}}
" colors {{{
syntax enable                  " enable syntax highlighting
set background=dark            " enable for dark terminals
colorscheme hybrid             " precision colors for machines and people
" }}}
" visual {{{
set relativenumber             " show line numbers
set lazyredraw                 " no redraw during macros
set scrolloff=2                " 2 lines above/below cursor when scrolling
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
" italic comments if an xterm
if &term =~ 'xterm.*'
    set t_ZH=[3m
    set t_ZR=[0m
    highlight Comment cterm=italic
endif
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
" fold colors
highlight Folded ctermbg=black ctermfg=grey
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
" list buffers
nnoremap <silent> <leader>l :ls<CR>:b<Space>
" clear search highlights
nnoremap <silent> <leader>. :nohlsearch<CR>
" toggle comment
map <silent> <leader>/ gcc
" enclosure mappings
nnoremap <silent> <leader>' f'ci'
nnoremap <silent> <leader>" f"ci"
nnoremap <silent> <leader>( f(ci(
nnoremap <silent> <leader>) f)ci)
nnoremap <silent> <leader>[ f[ci[
nnoremap <silent> <leader>] f]ci]
nnoremap <silent> <leader>{ f{ci{
nnoremap <silent> <leader>} f}ci}
nnoremap <silent> <leader>< f<ci<
nnoremap <silent> <leader>> f>ci>
" toggle line numbers
nmap <silent> <leader>n :call ToggleNumber()<CR>
" }}}
" mappings {{{
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" unmap arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
" buffers
map <S-Up> <Esc>;e<Space>
map <S-Down> <Esc>;bd<CR>
map <S-Left> <Esc>;bprevious<CR>
map <S-Right> <Esc>;bnext<CR>
" tabs
map <C-Up> <Esc>;tabe<Space>
map <C-Left> <Esc>;tabprev<CR>
map <C-Right> <Esc>;tabnext<CR>
" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" auto indent on paste
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
" xterm keys when tmux is running
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
" post factum sudo vim
cmap w!! w !sudo tee % >/dev/null
" }}}
" autogroups {{{
augroup vimrc
    autocmd filetype html,xml set listchars-=tab:>. smartindent smarttab softtabstop=2 shiftwidth=2 expandtab
    autocmd filetype javascript set smartindent smarttab softtabstop=2 shiftwidth=2 expandtab
    autocmd filetype javascript abbreviate csl console.log();<Esc>hi
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
