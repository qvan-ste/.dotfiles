" UTF encoding
set encoding=utf-8
" Set interface language to English (if available)
try
    language en_US
catch
    " Fallback to system default if en_US is not available
endtry
" Enable line nubring
set number
" Enable line wrapping
set wrap 
" Enable mouse support
set mouse=a
" Command autocompletion on tab
set wildmenu
" Reduce screen refreshes
set lazyredraw
" Highlight matching parantheses
set showmatch
" Display cursor position
set ruler
" Disable bell
set belloff=all
" Set tab to 4 spaces
set tabstop=4
" Auto indentation based on previous line
set autoindent
" Auto indent based on language structure
set smartindent
" List search results while typng
set incsearch
" Highlight search matches
set hlsearch
" 256 coluor support
set t_Co=256
" Enable true colour for better colours
set termguicolors
" Syntax highlighting
syntax enable
" Colour scheme (only if colors directory exists)
if filereadable(expand('~/.vim/colors/catppuccin_mocha.vim'))
    colorscheme catppuccin_mocha
endif
