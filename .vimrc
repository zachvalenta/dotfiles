" [PV xxv]
set nocompatible " disable Vi compatability https://vi.stackexchange.com/q/25149
filetype plugin on " enables built-in plugins (for stuff like netrw)

" [PV 10.51]
set incsearch " highlight matches as you type
set hlsearch " highlight matches from last search
set ignorecase " need to set this for smartcase to work
set smartcase " same as rg; insensitive if query lower, sensitive if query upper

" ZA
set relativenumber "relative line numbers
syntax enable "highlighting
:set backspace=indent,eol,start "macOS delete key workaround https://stackoverflow.com/a/22390576
set hidden "idk
set number "show line numbers
set ts=4 " map tab key to add 4 spaces https://www.fullstackpython.com/vim.html
:autocmd BufRead /Users/zach/Desktop/zvmac/notes/sw/za/industry.md set scrolloff=999 " config per file https://stackoverflow.com/a/456846

" highlight on enter/exist insert mode https://stackoverflow.com/a/7619510/6813490 http://yannesposito.com/Scratch/en/blog/Vim-as-IDE/
set cursorline
autocmd InsertEnter * highlight CursorLine ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=None
