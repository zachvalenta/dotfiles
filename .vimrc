" [PV xxv]
set nocompatible
filetype plugin on

" [PV 10.51]
set incsearch " highlight matches as you type
set hlsearch " highlight matches from last search

" ZA
set relativenumber "relative line numbers
syntax enable "highlighting
:set backspace=indent,eol,start "macOS delete key workaround https://stackoverflow.com/a/22390576
set hidden "idk
set number "show line numbers

" highlight on enter/exist insert mode https://stackoverflow.com/a/7619510/6813490 http://yannesposito.com/Scratch/en/blog/Vim-as-IDE/
set cursorline
autocmd InsertEnter * highlight CursorLine ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=None
