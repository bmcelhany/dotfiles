" Required ================================================

set nocompatible
filetype off

" PLUGINS =================================================

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundle manager
Plugin 'gmarik/Vundle.vim'

" Tagbar
Plugin 'majutsushi/tagbar'

" Git
Plugin 'tpope/vim-fugitive'

" Auto-complete brackets, quotes, etc
Plugin 'jiangmiao/auto-pairs'

" Search
Plugin 'rking/ag.vim'

" File name search
Plugin 'kien/ctrlp.vim'

" Markdown folding
Plugin 'nelstrom/vim-markdown-folding'

" File browser
Plugin 'scrooloose/nerdtree'

" Autoformat markdown tables
Plugin 'dhruvasagar/vim-table-mode'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'blueshirts/darcula'
Plugin 'joshdick/onedark.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'bmcelhany/diagonaltoast'
Plugin 'chriskempson/base16-vim'
Plugin 'jacoborus/tender'

" JSON
Plugin 'elzr/vim-json'

" JavaScript
Plugin 'pangloss/vim-javascript'

" Markdown highlighting-free writing
Plugin 'plasticboy/vim-markdown'

" Required
call vundle#end()

filetype plugin indent on

" Don't conceal the double-quotes in JSON
let g:vim_json_syntax_conceal = 0

" File exporer
noremap <F2> :NERDTreeToggle<CR>

" Tagbar
noremap <F8> :TagbarToggle<CR>

" Remap ESC
imap jk <ESC>

" Gui
" ========================================================
"set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h15

" GENERAL SETTINGS =======================================

set timeoutlen=1000
set ttimeoutlen=0
set ignorecase
if exists("&wildignorecase") " Case-insensitive tab completion
set wildignorecase
endif
set cursorline			" Highlight the current line
set number				" Show line numbers
set ruler               " Show line/col status
set autoindent			" Automatically indent the next line
"set smartindent
set wildmenu            " Visual autocomplete for command menu
set showmatch           " highlight matching braces
set guioptions-=r		" Remove side scrollbars
set guioptions-=L		" Remove top/bottom scrollbars
set guioptions+=e       " Visual tabs in MacVim
set showbreak=...       " Visual cue for wrapped lines
set wrap                " Wrap text automatically
set linebreak			" Don't wrap in the middle of a word
set textwidth=120       " Seems too narrow, but matches Apple standards
set laststatus=2        " Always show status line
set cpoptions+=$        " Show a $ at end of boundary that we're changing
set mouse=a             " Enable scrolling

" Strip trailing whitespace (<leader> ww)
function! StripWhitespace()
let save_cursor = getpos(".")
let old_query = getreg('/')
:%s/\s\+$//e
call setpos('.', save_cursor)
call setreg('/', old_query)
endfunction
nnoremap <leader>ww :call StripWhitespace()<CR>

" Allow switching buffers without saving them first
:set hidden

" Recognize *.md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Recognize *.ctp as PHP
autocmd BufNewfile,BufReadPost *.ctp set filetype=php

" JAVA
:let java_highlight_functions="style"

" COLORS ==================================================

set background=dark
syntax enable			" Syntax highligting
let g:hybrid_custom_term_colors = 1
colorscheme diagonaltoast

" TABS ====================================================

set expandtab
set autoindent
set shiftwidth=4
set tabstop=4

" MAPPINGS ================================================

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Map Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Enable copy/paste between VIM and other apps
set clipboard=unnamed
vmap <Leader>y "*y
vmap <Leader>yy "*Y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Set the leader to the comma
let mapleader=","

" Toggle tablemode
nmap <Leader>tm :TableModeToggle<CR>

" Move between splits using standard motion keys
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Move between buffers using TAB
:nnoremap <Tab> :bnext<CR>

:nnoremap <S-Tab> :bprevious<CR>

" Shortcut to change to current working directory for new files
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Quickly create an empty buffer
nnoremap <Leader>n :enew<CR>i

" Save current session layout
nnoremap <Leader>s :mksession<CR>

" Easier buffer switching
noremap <F5> :buffers<CR>:buffer<Space>

" Edit .vimrc in vertical split
nnoremap <Leader>ev :vsp $MYVIMRC<CR>

" Enable paste from external app without auto-indent
nmap <silent> <leader>p :set paste<cr>"*p:set nopaste<cr>

" Prettify JSON
nnoremap <Leader>j :%!python -m json.tool<CR>gg=G<CR>

" SEARCH ======================================================

" Open Ag search (,f): ! = don't open first match
nnoremap <Leader>f <ESC>:Ag!<space>

" Incrementally search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Turn on highlighted matches
nnoremap <Leader><space> :nohlsearch<CR>

" Type CTRL-C to correctly place cursor after delimitmate adds closing
imap <C-c> <CR><Esc>O

" FOLDING =====================================================

set foldenable          " Enable folding
set foldlevelstart=10   " Open most folds by default
set foldnestmax=10      " Max of 10 nested folds
nnoremap <space> za     " Toggle folds using space bar
set foldmethod=syntax   " Fold based on syntax highlighting
