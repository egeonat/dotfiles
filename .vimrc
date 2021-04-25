set nocompatible   " required for Vundle
filetype off       " required for Vundle

" Remove existing autocommands
autocmd!  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Vundle plugins here

" Color themes
Plugin 'morhetz/gruvbox'
" Git support
Plugin 'tpope/vim-fugitive'
" Status bar
Plugin 'vim-airline/vim-airline'
" Status bar themes
Plugin 'vim-airline/vim-airline-themes'
" Faster folding
Plugin 'konfekt/fastfold'
" Asynchronous linting/fixing
Plugin 'dense-analysis/ale'
" Comment/uncomment code
Plugin 'tpope/vim-commentary'
" Python completion help
Plugin 'davidhalter/jedi-vim'
" Python indentation
Plugin 'vim-scripts/indentpython.vim'
" Python folding
Plugin 'tmhedberg/SimpylFold'
" Julia support
Plugin 'JuliaEditorSupport/julia-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Colorscheme
colorscheme gruvbox
set background=dark

" Show statusline always
set laststatus=2
" Show ale errors on airline
let g:airline#extensions#ale#enabled = 1

" Split window navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <Space> za

if &term =~ "screen-256color"                                                   
	let &t_BE = "\e[?2004h"                                              
	let &t_BD = "\e[?2004l"                                              
	exec "set t_PS=\e[200~"                                              
	exec "set t_PE=\e[201~"                                              
endif

set ts=4 sw=4
set encoding=utf-8

" Detect julia files properly
autocmd BufRead,BufNewFile *.jl set filetype=julia

" General bad whitespace detection
au BufRead, BufNewFile *.py,*.pyw,*.jl,*.c,*.h match BadWhitespace /\s\+$/

" Allow backspacing normally
set backspace=indent,eol,start

" Search case settings
set ignorecase
set smartcase

syntax on

" Line numbers
set nu

" Use default clipboard
set clipboard=unnamed

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
