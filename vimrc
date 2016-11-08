" vimrc {{{
" Brandon Freitag, 2016
" vim:fdm=marker:fdl=0
" }}}
" plugins {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'lambdatoast/elm.vim'
Plugin 'fatih/vim-go'
Plugin 'keith/swift.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

" }}}
" plugin settings {{{

" solarized
let g:solarized_termtrans = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" rust
let g:rustfmt_autosave = 1

" }}}
" colors {{{

syntax enable                  " enable syntax highlighting
set background=dark            " enable for dark terminals
colorscheme solarized          " precision colors for machines and people

" }}}
" visual {{{

set number relativenumber      " show current line number, others relative
set showmode showcmd ruler     " status line: mode, command, cursor position
set showmatch matchtime=2      " show matching bracket for 0.2 seconds
set novisualbell noerrorbells  " don't beep
set lazyredraw                 " no redraw during macros
set ttimeout                   " exit modes quickly
set scrolloff=2                " 2 lines above/below cursor when scrolling
set nowrap                     " do not wrap lines

" completion menu
set wildmenu wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

" highlight trailing whitespace
set list listchars=tab:>.,trail:.,extends:#,nbsp:.

" italic comments if an xterm
if &term =~ 'xterm.*'
  set t_ZH=[3m
  set t_ZR=[0m
  highlight Comment cterm=italic
endif

" }}}
" system {{{

" usability
set hidden                     " hide files with unsaved changes
set history=1000               " keep 1000 lines of command history
set backspace=indent,eol,start " allow backspacing in insert mode
set mouse=a                    " allow mouse usage
set confirm                    " get a dialog when :q, :w, or :wq fails

" timeout fix for ^[O issue
set timeoutlen=1000 ttimeoutlen=0

" no backup~ or swap files
set nobackup noswapfile

" keep 1000 lines of undo history, save in ~/.vim/undo
set undolevels=1000 undofile undodir=~/.vim/undo

" }}}
" spaces {{{

set smartindent smarttab       " indent on new line with spaces
set tabstop=4 softtabstop=4    " number of spaces per tab
set shiftwidth=4               " number of spaces per indent
set expandtab                  " expand tabs in insert mode

" }}}
" searching {{{

set hlsearch incsearch         " highlight search matches as you type
set ignorecase smartcase       " search case sensitive only if you type uppercase characters
set magic                      " change the way backslashes are used in search patterns

" }}}
" folding {{{

set foldenable                 " enable folding
set foldlevelstart=10          " open some folds by default
set foldnestmax=10             " nested fold max
set foldmethod=indent          " fold on indent

" fold colors
highlight Folded ctermbg=black ctermfg=grey

" }}}
" leader shortcuts {{{

let mapleader=","

" copy, paste, cut
nnoremap <silent> <leader>c "+y
vnoremap <silent> <leader>c "+y
nnoremap <silent> <leader>v "+p
vnoremap <silent> <leader>v "+p
nnoremap <silent> <leader>x "+x
vnoremap <silent> <leader>x "+x

" toggle comment
map <silent> <leader>/ gcc

" global replace
nnoremap <silent> <leader>g :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <silent> <leader>G :%s/\<<C-r><C-W>\>//g<Left><Left>

" list buffers
nnoremap <silent> <leader>l :ls<CR>:b<Space>

" clear search highlights
nnoremap <silent> <leader>. :nohlsearch<CR>

" toggle line numbers
nmap <silent> <leader>n :call ToggleNumber()<CR>

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
nnoremap <silent> <leader>t f>cit

" redraw
nnoremap <silent> <leader>r :redraw!

" edit/reload the vimrc file
nnoremap <silent> <leader>, :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" }}}
" mappings {{{

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" visual lines
nnoremap j gj
nnoremap k gk

" open/close folds
nnoremap <space> za

" end-of-line yank
nnoremap Y y$

" auto indent on paste
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" buffers
map <S-Up> <Esc>;e<Space>
map <S-Down> <Esc>;bd<CR>
map <S-Left> <Esc>;bprevious<CR>
map <S-Right> <Esc>;bnext<CR>

" tabs
map <C-Up> <Esc>;tabe<Space>
map <C-Left> <Esc>;tabprev<CR>
map <C-Right> <Esc>;tabnext<CR>

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

    " cd to the directory fo file
    autocmd BufEnter * silent! lcd %:p:h 

    " Shell
    autocmd filetype sh set smartindent smarttab softtabstop=2 shiftwidth=2 expandtab

    " HTML, XML
    autocmd filetype html,xml set smartindent smarttab softtabstop=2 shiftwidth=2 expandtab

    " JavaScript
    autocmd filetype javascript set smartindent smarttab softtabstop=4 shiftwidth=4 textwidth=99 expandtab
    autocmd filetype javascript abbreviate csl console.log();<Esc>hi
    autocmd filetype javascript execute "set colorcolumn=" . join(range(101,355), ',')
    autocmd filetype javascript highlight ColorColumn ctermbg=0
    autocmd filetype javascript let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
    autocmd filetype javascript let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
    autocmd filetype javascript let b:syntastic_checkers = ['eslint']

    " Python
    autocmd filetype python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=159 expandtab autoindent fileformat=unix
    autocmd filetype python abbreviate pr print
    autocmd filetype python execute "set colorcolumn=" . join(range(161,415), ',')
    autocmd filetype python highlight ColorColumn ctermbg=0

    " C
    autocmd filetype c set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
    autocmd filetype c execute "set colorcolumn=" . join(range(80,334), ',')
    autocmd filetype c highlight ColorColumn ctermbg=0

    " Elm
    autocmd filetype elm set smartindent smarttab softtabstop=2 shiftwidth=2 textwidth=99 expandtab
    autocmd filetype elm execute "set colorcolumn=" . join(range(101,355), ',')
    autocmd filetype elm highlight ColorColumn ctermbg=0

    " Swift
    autocmd filetype swift set smartindent smarttab softtabstop=4 shiftwidth=4 textwidth=99 expandtab
    autocmd filetype swift execute "set colorcolumn=" . join(range(101,355), ',')
    autocmd filetype swift highlight ColorColumn ctermbg=0
    autocmd filetype swift let b:syntastic_checkers = ['swiftpm']

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
