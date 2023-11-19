" Neil practical vim xxv
set nocompatible " disable Vi compatability https://vi.stackexchange.com/q/25149
filetype plugin on " enables built-in plugins (for stuff like netrw)

nnoremap <SPACE> <Nop> " ensure space not mapped to anything else
let mapleader = ' '    " map space to leader

" Neil practical vim 10.51
set incsearch " highlight matches as you type
set hlsearch " highlight matches from last search
set ignorecase " need to set this for smartcase to work
set smartcase " same as rg; insensitive if query lower, sensitive if query upper

" visual
set number "show line numbers
set relativenumber "relative line numbers
syntax enable "highlighting
colorscheme gruvbox " options: gruvbox, material, vividchalk
set laststatus=2 " statusline: lightline

" misc
:set backspace=indent,eol,start "macOS delete key workaround https://stackoverflow.com/a/22390576
set hidden "idk
set ts=4 " map tab key to add 4 spaces https://www.fullstackpython.com/vim.html
:autocmd BufRead /Users/zach/Desktop/zvmac/notes/sw/za/industry.md set scrolloff=999 " config per file https://stackoverflow.com/a/456846

" highlighting on enter/exit insert mode https://stackoverflow.com/a/7619510/6813490 http://yannesposito.com/Scratch/en/blog/Vim-as-IDE/
set cursorline
autocmd InsertEnter * highlight CursorLine ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=None

" workaround to open URL under cursor https://vimtricks.com/p/open-url-under-cursor/
function! OpenURLUnderCursor()
  let s:uri = expand('<cWORD>')
  let s:uri = substitute(s:uri, '?', '\\?', '')
  let s:uri = shellescape(s:uri, 1)
  if s:uri != ''
    silent exec "!open '".s:uri."'"
    :redraw!
  endif
endfunction
nnoremap gx :call OpenURLUnderCursor()<CR>
