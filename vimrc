""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " enable filetype detection
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set mouse=a " enable mouse for all modes
set number  " show line numbers

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quicker split mode navigtion
" This doesn't seem to work for interactive :terminal
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WIP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create a small window below that displays the output of running the
" flake8 linter against the current file
function! RunFlake8(code_buf)
    let lint_buf = bufwinnr("flake8")
    if lint_buf > 0
        :exe lint_buf "wincmd w"
        :ter ++curwin flake8 . a:code_buf
        :wincmd p
    else
        :bel ter ++rows=10 flake8 . a:code_buf
        :wincmd p
    endif
endfunction

:nnoremap <F8> :call RunFlake8(expand("%"))<cr>

" Close the flake8 window
function! CloseFlake8()
    let lint_buf = bufwinnr("flake8")
    if lint_buf > 0
        :exe lint_buf "wincmd w"
        :wincmd q
    endif
endfunction

:nnoremap <leader><F8> :call CloseFlake8()<cr>
