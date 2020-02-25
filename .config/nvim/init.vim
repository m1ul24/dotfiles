" vim-plug-----------------------------

call plug#begin('~/.config/nvim/plugged')

" intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" input support
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" undo tree
Plug 'sjl/gundo.vim'

" check syntax
Plug 'dense-analysis/ale'

" display
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" language
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" file explorer
Plug 'scrooloose/nerdtree'

" others
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" End vim-plug-------------------------


" General -----------------------------

filetype plugin on
syntax on

set encoding=utf8

" disable automatic comment
au FileType * set fo-=c fo-=r fo-=o

" history
set history=50

" display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu
set number

" line wrapping
set nowrap
set linebreak
set showbreak=▹

" auto indent what you can
set autoindent

" searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" enable jumping into files in a search buffer
set hidden

" make backspace a bit nicer
set backspace=eol,start,indent

" indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" disable mouse
set mouse=

" visual prompt for command completion
set wildmenu

" folding
set nofoldenable

" use the system clipboad
set clipboard+=unnamedplus

" theme
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" End General -------------------------


" Key maps ----------------------------

" leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>

" to nomal mode from insert mode
inoremap <silent> jj <ESC>

" gundo toggle
nnoremap <silent> <space>u :GundoToggle<CR>

" direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" split window
nmap <Space>s :split<Return><C-w>w
nmap <Space>v :vsplit<Return><C-w>w

" End key maps ------------------------


" Plugins -----------------------------

" powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" nerdtree
nnoremap <silent> <space>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1 " show dotfiles

" fzf
nnoremap <silent> <C-p> :Files<CR>

" typescript-vim
let g:typescript_indent_disable = 1

" ale
let g:ale_fixers = {'vue': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_linter_aliases = {'vue': ['typescript', 'javascript', 'html', 'scss']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'scss': ['scss-lint'],
\}

" Language server
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" End plugins -------------------------
