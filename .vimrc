" Chris' VIMrc

" Plugins {{{
" =============================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-session'

" Themes
Plugin 'cdmedia/itg_flat_vim'
Plugin 'sickill/vim-monokai'

call vundle#end()
filetype plugin indent on
" }}}

" Theme {{{
" =============================================================================

" set theme
colorscheme itg_flat

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
 	let g:rehash256 = 1
   	set guitablabel=%M\ %t
endif

set background=dark
"hi Normal ctermfg=252 ctermbg=none
"set guifont=Menlo:h14

" }}}

" Spaces & Tabs {{{
" =============================================================================

set smartindent			" does the right thing (mostly)
set autoindent			" indenting on
set tabstop=4			" number of visual spaces per TAB
set softtabstop=0		" number of spaces in TAB when editing
set noexpandtab			" tabs are not spaces
set shiftwidth=4		" how many spaces are reindented when shifting
"set paste				" fix indent when pasting
"set expandtab
"set smarttab

" }}}

" Layout {{{
" =============================================================================

syntax enable			" enable syntax processing
set number				" show line numbers
set showcmd				" show command in bottom bar
set cursorline			" highlight current line
set wildmenu			" visual autocomplete for command menu
set nowrap				" nowrap fix (can be wrap for small screens)
set textwidth=80		" if wrap is used re-format wrap to 80
"set colorcolumn=80		" add a ruler at 80
"highlight ColorColumn guibg=Gray12
set splitbelow			" open horizontal splits below current window
" }}}

" Status Line {{{
" =============================================================================

" Always show the status line
set laststatus=2

" Custom Statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%6*\ %{fugitive#statusline()}\            "git status line
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat(dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ %l/%L\              				"Rownumber/total (%)
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
"set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
function! HighlightSearch()
    if &hls
        return 'H'
    else
        return ''
    endif
endfunction
" File path
hi User1 ctermbg=237 guibg=237 ctermfg=250 guifg=250
" Git status
hi User6 ctermfg=250 guifg=250 guibg=25  ctermbg=25
" File type
hi User2 ctermfg=234 guifg=234 ctermbg=32 guibg=32
hi User3 ctermfg=237 guifg=237
hi User4 ctermfg=237 guifg=237
hi User5 ctermfg=237 guifg=237
hi User8 ctermfg=237 guifg=237

" }}}

" Searching {{{
" =============================================================================

set showmatch			" highlight matching
set incsearch			" search as characters are entered
set hlsearch			" highlight matches
set ignorecase			" ignore case when searching
set smartcase			" use case if any case is used
" }}}

" Folding {{{
" =============================================================================

set foldenable			" enable folding
set foldlevelstart=10	" open most folds by default
set foldnestmax=10		" 10 nested fold max
set foldmethod=indent	" fold based on indent level (marker,expr,syntax,diff)
" }}}

" Other Settings {{{
" =============================================================================

" Optimize for fast terminal connections
set ttyfast

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use unix as the standard file type
set fileformats=unix,dos,mac

" Map Leader to comma
let mapleader = ","
let g:mapleader = ","

set modelines=1			" use specific settings at bottom only for this file
set timeoutlen=500		" fixes slight lag after typing the leader key + command
filetype on
filetype plugin on
filetype indent on

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow for mouse scroll
"set mouse=nicr
set mouse=a

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" }}}

" FileType Specific {{{
" =============================================================================

" PHP - activate by ctrl-n in insert mode or ctrl-x,ctrl-o
" php lint - :!php -l %
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Javascript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd Filetype markdown setlocal wrap
"autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal spell!

" }}}

" Remapped Keys {{{
" =============================================================================

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" jj is escape
imap jj <esc>

" XX is quit all
nnoremap XX :qa<CR>

" Close current buffer
nnoremap <leader>bx :Bclose<cr>

" Close all buffers
nnoremap <leader>bxa :1,1000 bd!<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Auto complete
"iabbrev </ </<C-X><C-O>
imap <C-Space> <C-X><C-O>

" Better tab switching
nnoremap { gT
nnoremap } gt
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" Command line overrides
ca tn tabnew
ca te tabedit
ca th tabp
ca tl tabn

" }}}

" Plugin Settings {{{
" =============================================================================

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Vexplore toggle function settings
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20
" let g:netrw_dirhistmax = 0
" set autochdir

" Vim Notes settings
let g:notes_directories = ['~/Documents/Notes', '~/Google\ Drive/Work/TheSearchMonitor/Notes']

" Vim Session settings
let g:session_autosave = 'yes'
let g:session_directory = '~/Sessions'

" Plugin remapped keys
" ===================

" Toggle NERDTree
silent! map tt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" }}}

" Custom Functions {{{
" =============================================================================

" strips trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer()
"    if exists("t:expl_buf_num")
"        let expl_win_num = bufwinnr(t:expl_buf_num)
"        if expl_win_num != -1
"            let cur_win_nr = winnr()
"            exec expl_win_num . 'wincmd w'
"            close
"            exec cur_win_nr . 'wincmd w'
"            unlet t:expl_buf_num
"        else
"            unlet t:expl_buf_num
"        endif
"    else
"        exec '1wincmd w'
"        Vexplore
"        let t:expl_buf_num = bufnr("%")
"    endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>

" autosave session on exit
"au VimLeavePre * if v:this_session != '' | exec 'mks! ' . v:this_session | endif

" }}}

" vim:foldmethod=marker:foldlevel=0
