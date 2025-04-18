" ========== BASIC SETTINGS ==========
set nocompatible     " Ensure Vim behaves sanely (disable Vi compatibility)
syntax on            " Enable syntax highlighting
set mouse=a          " Enable mouse support
set number           " Show line numbers
set relativenumber   " Use relative line numbers
set hidden           " Allow buffer switching without saving
set ignorecase       " Case insensitive search...
set smartcase        " ...unless uppercase is used
set incsearch        " Show search results as you type
set hlsearch         " Highlight search results
set clipboard=unnamedplus  " Use system clipboard for copy-paste
set backspace=indent,eol,start " Better backspace behavior
set undofile         " Enable persistent undo
let mapleader = " "  " <Space> as the leader key

" ========== FILE NAVIGATION ==========
set path+=**         " Allow recursive search with :find
set wildmenu         " Enhance command-line completion
set wildmode=longest,list,full " More interactive command-line completion

" ========== WINDOW NAVIGATION ========
nnoremap <leader>wv :vsplit<CR>     " Split the window vertically
nnoremap <leader>wh :split<CR>      " Split the window horizontally
nnoremap <leader>h :wincmd h<CR>    " Navigate to the left window
nnoremap <leader>j :wincmd j<CR>    " Navigate to the window below
nnoremap <leader>k :wincmd k<CR>    " Navigate to the window above
nnoremap <leader>l :wincmd l<CR>    " Navigate to the right window
nnoremap <leader>e :Lexplore<CR>    " Open the file explorer with <leader>e

" ========== AUTOCOMPLETE ==========
set completeopt=menuone,noselect " Improve autocomplete UI

" ========== INDENTATION ==========
set tabstop=4        " Set tab width to 4 spaces
set shiftwidth=4     " Auto-indent width to 4 spaces
set expandtab        " Convert tabs to spaces
set autoindent       " Maintain indentation

" ========== AUTOPAIRS ==========
" Enable matching pairs (built-in)
runtime! macros/matchit.vim
set showmatch        " Highlight matching braces

" ========== CTAGS SUPPORT ==========
set tags=./tags,tags;$HOME " Look for tags file in project root and in $HOME

" === Ctags-based navigation ===
nnoremap gd <C-]>         " Go to the definition of the symbol under the cursor
nnoremap gD g]            " Show all matching tags (similar to 'gd', but displays all occurrences)

" === Search for references (inside Vim) ===
nnoremap <leader>r :vimgrep /<C-r><C-w>/g **/*<CR>:copen<CR> " Search for references of the word under the cursor and open the quickfix window
nnoremap <leader>n :cnext<CR>  " Go to the next reference (quickfix list)
nnoremap <leader>p :cprev<CR>  " Go to the previous reference (quickfix list)

" === Create tags ===
command! MakeTags !ctags -R . || echo "Error: ctags failed to generate tags!" " Create tags for the project, run ctags -R, and show an error message if it fails

" ========== QUALITY-OF-LIFE ==========
autocmd FileType markdown setlocal spell " Enable spell checking for Markdown files
autocmd InsertLeave * set nopaste        " Turn off paste mode when exiting insert mode to avoid format issues
set scrolloff=5 " Keep the cursor a little away from the top/bottom of the screen for better visibility