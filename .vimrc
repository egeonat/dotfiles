set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmhedberg/SimpylFold'
Plugin 'konfekt/fastfold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Colorscheme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

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

" .py file settings
au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=100 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

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

let python_highlight_all=1
syntax on

" Show statusline always
set laststatus=2

set nu

" Use default clipboard
set clipboard=unnamed

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
