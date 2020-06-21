" VIMRC

set nocompatible
filetype off

filetype plugin indent on
syntax enable

"colorscheme monokai
colorscheme itg_flat

set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set number
set showcmd
set wildmenu
set nowrap
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set encoding=utf-8
"set colorcolumn=80
set cm=blowfish2
set backupdir=~/.vim/swapfiles/.backup/,/tmp//
set directory=~/.vim/swapfiles/.swp/,/tmp//
set undodir=~/.vim/swapfiles/.undo/,/tmp//

nnoremap { gT
nnoremap } gt
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap jj <Esc>

autocmd BufWritePre * :%s/\s\+$//e

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Web
au BufRead,BufNewFile *.js,*.html,*.css,*.vue,*.php
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" PEP8
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.r match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.r,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw,*.r,*.c,*.h
    \ set tabstop=8 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ let python_highlight_all=1
