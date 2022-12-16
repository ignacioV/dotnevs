set relativenumber
set number 
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set mouse=a		" Enable mouse usage (all modes)
set scrolloff=10

nnoremap <SPACE> <Nop>
let g:mapleader = " "
nnoremap <leader>a :echo("\<leader\> works! It is set to '<leader>'")<CR>

"paste/cut without deleting buffer 
xnoremap <leader>p "_dP
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Yank from cursor to the end of line.
nnoremap Y y$

"yank/paste from/to clipborad
noremap <leader>y "+y
noremap <leader>p "+p

"select all, like CTRL+A
noremap <leader>A ggVG

"surround with " double quote / single quotes
vnoremap <leader>" c""<Esc>P
vnoremap <leader>' c''<Esc>P
