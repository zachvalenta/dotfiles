" DREW NEIL'S MINIMAL CONFIG [PV xxv]
set nocompatible
filetype plugin on

" SEARCH
set incsearch " highlight matches as you type
set hlsearch " highlight matches from last search

" ZA
set hidden "idk
set number "show line numbers
set relativenumber "relative line numbers
:set backspace=indent,eol,start "macOS delete key workaround https://stackoverflow.com/a/22390576
syntax enable "highlighting
" CHANGE FORMATTING ON ENTER/EXIST INSERT MODE
set cursorline " https://stackoverflow.com/a/7619510/6813490 + http://yannesposito.com/Scratch/en/blog/Vim-as-IDE/
autocmd InsertEnter * highlight CursorLine ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=None
