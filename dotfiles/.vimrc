" Ale linters
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust':['analyzer'], 'python': ['pylsp', 'flake8', 'mypy']}
let g:ale_python_pyls_executable = 'pylsp'

" leader
let mapleader = "@"

" BASICS
set nocompatible
:set noswapfile
set hlsearch
set nobackup
set ruler
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
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf
Plug 'junegunn/fzf.vim' "fzf.vim
call plug#end()
colorscheme apprentice

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

" fzf
set rtp+=/opt/homebrew/bin/fzf
nnoremap <leader><Tab> :GFiles<CR>
nnoremap <leader><S-Tab> :tabnew<CR>:GFiles<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :tabnew<CR>:Files<CR>
nnoremap <leader>v :vs<CR>:Files<CR>
nnoremap <leader>h :split<CR>:Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>G :tabnew<CR>:Rg<CR>
