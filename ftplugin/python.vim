let b:ale_linters = ["flake8, pyls"]
let b:ale_fixers = ["isort"]
let b:ale_fix_on_save = 1
au BufWritePre * %s/\s\+$//e
let python_highlight_all=1
set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=100
    \ expandtab
    \ autoindent
    \ fileformat=unix
