" Minimal Vim config for lightweight usage

" Enable line numbers and relative numbers
set number
set relativenumber

" Keep some context lines visible when scrolling
set scrolloff=15

" Enable syntax highlighting
syntax on

" Clipboard mappings (copy/paste using system clipboard)
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <C-v> "+gP

" File encoding and formats
set fileformat=unix
set encoding=utf-8
set t_Co=256

" Tabs and indentation (4 spaces, convert tabs to spaces)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Autocompletion with Ctrl+Space in insert mode
inoremap <C-Space> <C-n>

" Map F12 to regenerate ctags (if you use ctags)
map <F12> :!ctags -R .<CR>

" Enable filetype detection, plugin, and indentation (basic)
filetype plugin indent on

" Minimal status line (replace airline with default statusline)
set laststatus=2          " Always show status line
set showcmd               " Show incomplete commands in status line
set ruler                 " Show cursor position

" Optional: Highlight matching parentheses/brackets
set showmatch
set matchtime=2           " How long to show matching paren (tenths of seconds)

" Enable mouse support (optional, remove if you don't want)
set mouse=a
