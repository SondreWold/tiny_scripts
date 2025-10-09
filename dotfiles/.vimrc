" Ale linters
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust':['analyzer'], 'python': ['pyright', 'mypy']}
set updatetime=300

" leader
let mapleader = "@"

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" BASICS
set encoding=utf-8
set noswapfile
set incsearch
set hlsearch
set nobackup
set ruler
set ai
filetype plugin indent on
set number
set visualbell t_vb=
set cursorline
set relativenumber
set shortmess-=S
set termguicolors

" Remaps
" Search and replace with ctrl-r 
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <leader><space> :nohlsearch<CR>

" CODE SUPPORT
syntax enable
filetype on
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf
Plug 'junegunn/fzf.vim' "fzf.vim
call plug#end()

" Theme
colorscheme nord

" LATEX VIEWER
let g:vimtex_view_method='skim'

" Better spell checking for LaTeX
autocmd FileType tex setlocal spell spelllang=en_us

" Faster compilation with continuous mode
let g:vimtex_compiler_latexmk = {
    \ 'continuous' : 1,
    \}

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


"Vimtex statusline hack
function! VimtexCompilerStatus()
    if exists('b:vimtex') && has_key(b:vimtex, 'compiler')
        if get(b:vimtex.compiler, 'status', -1) == 1
            return '[COMPILING]'
        elseif b:vimtex.compiler.is_running()
            return '[IDLE]'
        endif
    endif
    return ''
endfunction
set statusline=%f\ %h%w%m%r\ %{VimtexCompilerStatus()}%=%(%l,%c%V\ %=\ %P%)
