let g:ale_completion_enabled = 1
let g:ale_linters = {'rust':['analyzer'], 'haskell': ['hlint', 'hdevtools', 'hfmt'], 'python': ['pyright']}

" BASICS
set nocompatible
set hlsearch
set ai
filetype plugin indent on
set number
set visualbell t_vb=
set cursorline
set relativenumber

" Search and replace with ctrl-r 
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" CODE SUPPORT
syntax on
filetype on
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
call plug#end()
colorscheme habamax

" LATEX VIEWER
let g:vimtex_view_method='skim'

" ENFORCE VIMism
imap <up> <nop>
imap <down> <nop>
imap <right> <nop>
imap <left> <nop>

map <up> <nop>
map <down> <nop>
map <right> <nop>
map <left> <nop>

" STATUSLINE
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
