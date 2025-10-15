let mapleader = "@"

" Deactivate arrow keys
imap <up> <nop>
imap <down> <nop>
imap <right> <nop>
imap <left> <nop>
map <up> <nop>
map <down> <nop>
map <right> <nop>
map <left> <nop>

" ALE related settings
let g:ale_enabled = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust':['analyzer'], 'python': ['ruff', 'pyrefly']}
set updatetime=300

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" BASICS
set encoding=utf-8
set noswapfile
set incsearch  " Show search match during typing
set hlsearch  " Show search match
set nobackup
set ai  " Auto indent
filetype plugin indent on
set visualbell t_vb=  " Turn off annoying bell
set cursorline  " Highligt the line of the cursor position
set number
set relativenumber
set shortmess-=S  " Show matches for searches
set termguicolors  " Use 24-bit colours

" STATUSLINE
set laststatus=2
set noshowmode

" REMAPS
" Search and replace with ctrl-r 
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Remove highlight after search
nnoremap <leader><space> :nohlsearch<CR>

" CODE SUPPORT
syntax enable  " Enable font/colour change in text
filetype on  " Detect filetye

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fzf
Plug 'junegunn/fzf.vim' "fzf.vim
call plug#end()

" THEME
colorscheme nord

" LATEX
let g:vimtex_view_method='skim'
" Better spell checking for LaTeX
autocmd FileType tex setlocal spell spelllang=en_us
" Faster compilation with continuous mode
let g:vimtex_compiler_latexmk = {
    \ 'continuous' : 1,
    \}

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
