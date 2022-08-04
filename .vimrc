" VIMRC
"
" :vs/ex <partial file name><Tab>   file search
" :X                                encrypt file
" <C-W><C-J|K|L|H>                  split navigation
" <C-W> + z                         close preview
" gf                                cursor over filename and go to file
" /foo.*bar                         search content in file
" :vimgrep /foo/ **/*               search content across files
" :! <cmd> %                        run command on current file
" :sh                               enter shell
" :s%/foo/bar/gcc                   find and replace

set nocompatible
filetype off

filetype plugin indent on
syntax enable

colorscheme itg_flat

set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set smartindent
set nonumber
set showcmd
set wildmenu
set nowrap
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set magic
set encoding=utf-8
set cm=blowfish2
set backupdir=~/.vim/swapfiles/.backup/,/tmp//
set directory=~/.vim/swapfiles/.swp/,/tmp//
set undodir=~/.vim/swapfiles/.undo/,/tmp//
set autochdir

nnoremap { gT
nnoremap } gt
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap jj <Esc>
nnoremap <C-i> :copen <CR>

autocmd BufWritePre * :%s/\s\+$//e

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Web
let g:html_indent_script1 = "zero"
let g:html_indent_style1 = "zero"
au BufRead,BufNewFile *.js,*.html,*.css,*.vue,*.php,*.yml,*.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" PEP8
autocmd BufWritePost *.py call Flake8()
function Flake8()
    let filename=expand('%:p')
    silent! wincmd P
    if ! &previewwindow
        exec 'set splitbelow'
        10new " new or vnew
        exec 'setlocal buftype=nofile'
        exec 'setlocal winheight=10'
        set previewwindow
    endif
    execute '%d|silent 0r!flake8 --format "'.'\%(row)d:\%(col)d: \%(code)s \%(text)s'.'" --max-line-length 120 ' . filename
    if line('$') == 1
        execute ':q!'
    endif
    wincmd p
endfunction
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.r match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.r,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw,*.r,*.c,*.h
    \ set tabstop=8 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    "\ set textwidth=79 |
    "\ set colorcolumn=80 |
    \ let python_highlight_all=1


