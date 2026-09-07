" Show line numbers
set number
" Break lines at word (requires wrap lines)
set linebreak
" Line wrap (number of columns)
set textwidth=79
" Highlight column to allow consistent wrapping
set colorcolumn=80
" Highlight matching brace
set showmatch
" Disable vi compatibility
set nocompatible
" Enable filetype detection
filetype on
" Enable syntax highlighting
syntax on

" Highlight cursor line and column
set cursorline
set cursorcolumn

" Highlight all search results
set hlsearch
" Enable smart-case search
set smartcase
" Always case-insensitive
set ignorecase
" Search for strings incrementally
set incsearch

" Auto-indent new lines
set autoindent
" Use spaces instead of tabs
set expandtab
" Number of spaces for auto-indent 
set shiftwidth=4
" Enable smart indent
set smartindent
" Enable smart tabs
set smarttab
" Number of spaces per tab
set softtabstop=4
 
" Show row and column ruler
set ruler

" Number of undo levels
set undolevels=1000
" Backspace behavior
set backspace=indent,eol,start
" Format options
"   t: wrap text to textwidth
"   c: wrap comments to textwidth
"   q: allow formatting of comments with `gq`
set formatoptions=tcq

