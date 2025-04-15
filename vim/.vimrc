" ========== BASIC SETTINGS ==========
set nocompatible     " Ensure Vim behaves sanely
syntax on            " Enable syntax highlighting
set mouse=a          " Enable mouse support
set number           " Show line numbers
set relativenumber   " Use relative line numbers
set hidden           " Allow buffer switching without saving
set ignorecase       " Case insensitive search...
set smartcase        " ...unless uppercase is used
set incsearch        " Show search results as you type
set hlsearch         " Highlight search results
set clipboard=unnamedplus  " Use system clipboard
set backspace=indent,eol,start " Better backspace behavior
set undofile         " Enable persistent undo
let mapleader = " "  " <Space> as the leader key

" ========== FILE NAVIGATION ==========
set path+=**         " Allow recursive search with :find
set wildmenu         " Enhance command-line completion
set wildmode=longest,list,full

" ========== WINDOW NAVIGATION ========
nnoremap <leader>wv :vsplit<CR>     " Split the window vertically
nnoremap <leader>wh :split<CR>      " Split the window horizontally
nnoremap <leader>h :wincmd h<CR>    " Use H, J, K, L to navigate between windows
nnoremap <leader>j :wincmd j<CR>    " Use H, J, K, L to navigate between windows
nnoremap <leader>k :wincmd k<CR>    " Use H, J, K, L to navigate between windows
nnoremap <leader>l :wincmd l<CR>    " Use H, J, K, L to navigate between windows
nnoremap <leader>e :Lexplore<CR>    " Open the file explorer using :Lexplore with <leader>e

" ========== AUTOCOMPLETE ==========
set completeopt=menuone,noselect " Better autocomplete UI

" ========== INDENTATION ==========
set tabstop=4        " Set tab width
set shiftwidth=4     " Auto-indent width
set expandtab        " Convert tabs to spaces
set autoindent       " Maintain indentation

" ========== AUTOPAIRS ==========
" Use matchit and matchparen (built-in)
runtime! macros/matchit.vim
set showmatch        " Highlight matching braces

" ========== CTAGS SUPPORT ==========
set tags=./tags,tags;$HOME " Look for tags file in project
" === Ctags-based navigation ===
nnoremap gd <C-]>         " Go to definition
nnoremap gD g]            " Show all matching tags

" Search for references (inside Vim)
nnoremap <leader>r :vimgrep /<C-r><C-w>/g **/*<CR>:copen<CR>
nnoremap <leader>n :cnext<CR>  " Next reference
nnoremap <leader>p :cprev<CR>  " Previous reference

" Create tags
command! MakeTags !ctags -R .

" ========== QUALITY-OF-LIFE ==========
autocmd FileType markdown setlocal spell " Enable spell check in Markdown
autocmd InsertLeave * set nopaste        " Avoid paste mode issues
set scrolloff=5 " Keep cursor centered