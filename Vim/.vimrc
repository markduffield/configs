execute pathogen#infect()
syntax on
filetype plugin indent on

" == SETTINGS ============================================================
syntax on       			       " Coloured syntax
set background=dark		           " Theme
colorscheme tomorrow-night
set expandtab			           " Tabs - use 4 spaces
set tabstop
set shiftwidth=4
set number                         " Line numbers
set autoread		               " update files that change
set cursorline                     " highlight current line
set backupdir=~/.vim/backup//	   " Put swap files in the .vim direcory
set directory=~/.vim/swap//
autocmd BufWritePre * :%s/\s\+$//e " remove whitespace on save

" Ignore these files/folders 
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildignore+=*/vendor/**

" == KEYMAPS =============================================================
" Map a leader key
let mapleader = ","
let g:mapleader =","

" Navigate splits 
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Open NERD tree
map <C-b> :NERDTreeToggle<CR>

" Easy escaping to normal mode
imap jj <esc>

" Easy tabbing between buffers
nmap ` :bn<CR>

" Laravel Framework specific
nmap <leader>lr :e app/routes.php<cr>

" == CTRL+P ==============================================================
" include hidden files in search
let g:ctrlp_show_hidden=1
