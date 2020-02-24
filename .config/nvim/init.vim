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

" file explorer
Plug 'scrooloose/nerdtree'

" check syntax
Plug 'dense-analysis/ale'

" display
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'vim-scripts/xoria256.vim'
" Plug 'altercation/vim-colors-solarized'

" language
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

" others
Plug 'editorconfig/editorconfig-vim'

call plug#end()
" End vim-plug-------------------------

filetype plugin on
syntax on

" Leader
let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>

" To nomal mode from insert mode
inoremap <silent> jj <ESC>

set encoding=utf8

" History
set history=50

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu
set number

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Disable mouse
set mouse=

" vim-hybrid-material
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif
colorscheme hybrid_reverse

" Gundo toggle
nnoremap <silent> <space>u :GundoToggle<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Bash / emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Visual prompt for command completion
set wildmenu

" folding
set nofoldenable

" Use the system clipboad
set clipboard+=unnamedplus

" Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" NERDTree
nnoremap <silent> <space>t :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" fzf
nnoremap <silent> <Leader>f :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>h :History<CR>

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

