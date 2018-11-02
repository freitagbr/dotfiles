" vimrc {
" Brandon Freitag, 2018
" vim:fmr={,}:fdl=0:fdm=marker:

set nocompatible

" }
" plugins {

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'w0ng/vim-hybrid'

call plug#end()

" }
" plugin settings {

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" hybrid
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" }
" visual {

set number relativenumber      " show current line number, others relative
set showmode showcmd ruler     " status line: mode, command, cursor position
set showmatch matchtime=2      " show matching bracket for 0.2 seconds
set novisualbell noerrorbells  " don't beep
set lazyredraw                 " no redraw during macros
set ttimeout                   " exit modes quickly
set scrolloff=2                " 2 lines above/below cursor when scrolling
set nowrap                     " do not wrap lines

" colors
syntax enable                  " enable syntax highlighting
set background=dark            " enable for dark terminals
colorscheme hybrid             " hybrid colors for machines and people

" enable 256 color palette
if !has("gui_running")
    set t_Co=256
    set term=xterm-256color
endif

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

" }
" system {

" usability
set hidden                     " hide files with unsaved changes
set history=1000               " keep 1000 lines of command history
set backspace=indent,eol,start " allow backspacing in insert mode
set mouse=a                    " allow mouse usage
set confirm                    " get a dialog when :q, :w, or :wq fails
set splitbelow splitright      " sp to the bottom, vsp to the right

" timeout fix for ^[O issue
set timeoutlen=1000 ttimeoutlen=0

" no backup~ or swap files
set nobackup noswapfile

" save 1000 lines of undo history per file in ~/.vim/undo
set undolevels=1000 undofile undodir=~/.vim/undo

" }
" spaces {

set smartindent smarttab       " indent on new line with spaces
set tabstop=4 softtabstop=4    " number of spaces per tab
set shiftround shiftwidth=4    " number of spaces per indent
set expandtab                  " expand tabs in insert mode

" }
" searching {

set hlsearch incsearch         " highlight search matches as you type
set ignorecase smartcase       " search case sensitive only if you type uppercase characters
set magic                      " change the way backslashes are used in search patterns

" }
" folding {

set foldenable                 " enable folding
set foldlevelstart=10          " open some folds by default
set foldnestmax=10             " nested fold max
set foldmethod=indent          " fold on indent

" }
" leader shortcuts {

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
nnoremap <leader>g :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>G :%s/\<<C-r><C-W>\>//g<Left><Left>

" list buffers
nnoremap <leader>l :ls<CR>:b<Space>

" clear search highlights
nnoremap <silent> <leader>. :nohlsearch<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set relativenumber!<CR>

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

" splits
nnoremap <leader>- :new<Space>
nnoremap <leader>= :vnew<Space>
nnoremap <silent> <leader>k <C-w>t<C-w>K
nnoremap <silent> <leader>h <C-w>t<C-w>H

" redraw
nnoremap <silent> <leader>r :redraw!<CR>

" edit/reload the vimrc file
nnoremap <silent> <leader>, :tabe $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" }
" mappings {

nnoremap ; :
nnoremap : ;

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
noremap <C-p> p

" windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" buffers
map <S-Up> <Esc>;e<Space>
map <S-Down> <Esc>;Bclose<CR>
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

" nvim C-h workaround
if has('nvim')
    nmap <BS> <C-W>h
endif

" post factum sudo vim
cmap w!! w !sudo tee % >/dev/null

" }
" autogroups {
" autocd {
" cd to the directory of file
augroup autocd
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h 
augroup END
" }
" vimrc {
augroup filetype_vimrc
    autocmd!
    autocmd! BufWritePost .vimrc source %
    autocmd! BufWritePost .vimrc set modeline | doautocmd BufRead
augroup END
" }
" shell {
augroup filetype_sh
    autocmd!
    autocmd filetype sh set softtabstop=2 shiftwidth=2
augroup END
" }
" html, xml {
augroup filetype_html
    autocmd!
    autocmd filetype html,xml set softtabstop=2 shiftwidth=2 textwidth=79
augroup END
" }
" markdown {
augroup filetype_markdown
    autocmd!
    autocmd filetype markdown set noexpandtab softtabstop=4 shiftwidth=4 textwidth=79 formatoptions+=t
augroup END
" }
" c, c++ {
augroup filetype_cpp
    autocmd!
    autocmd filetype c,cpp set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 autoindent fileformat=unix
    autocmd filetype c,cpp setlocal comments-=:// comments+=f://
    autocmd filetype c,cpp let g:syntastic_c_include_dirs = ['../../include', '../include', 'include']
    autocmd filetype c,cpp let g:syntastic_c_checkers = ['cppcheck', 'cpplint']
    autocmd filetype c,cpp let g:syntastic_cpp_checkers = ['cppcheck', 'cpplint']
    autocmd filetype c,cpp let g:syntastic_cpp_cpplint_exec = 'cpplint'
augroup END
" }
" javascript {
augroup filetype_javascript
    autocmd!
    autocmd filetype javascript set softtabstop=2 shiftwidth=2 textwidth=99
    autocmd filetype javascript setlocal comments-=:// comments+=f://
    autocmd filetype javascript let b:syntastic_checkers = ['eslint']
augroup END
" }
" python {
augroup filetype_python
    autocmd!
    autocmd filetype python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=159
    autocmd filetype python set autoindent fileformat=unix
augroup END
" }
" crystal {
augroup filetype_crystal
    autocmd!
    autocmd filetype crystal set softtabstop=2 shiftwidth=2 textwidth=99
augroup END
" }
" go {
augroup filetype_go
    autocmd!
    autocmd filetype go set listchars-=tab:>.
    autocmd filetype go set listchars=tab:\ \ ,trail:.
    autocmd filetype go set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd filetype go set autoindent fileformat=unix
augroup END
" }
" }
