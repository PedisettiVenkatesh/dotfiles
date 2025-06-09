" set line numbers
set number relativenumber 
set so=15

" syntax highlighting
syntax on

" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <C-v> "+gP

" sane text files
set fileformat=unix
set encoding=utf-8
set t_Co=256

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4

" convert all typed tabs to spaces
set expandtab

"autocompletion with ctrl+space
inoremap <c-space> <c-n>
inoremap <Nul> <c-n>set number

" ctags
map <f12> :!ctags -R .<cr>

" start vi with NERDTree
"autocmd VimEnter * NERDTree | wincmd p

filetype plugin on

call plug#begin('~/.vim/plugged')
    " The default plugin directory will be as follows:
    "   - Vim (Linux/macOS): '~/.vim/plugged'
    "   - Vim (Windows): '~/vimfiles/plugged'
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " You can specify a custom plugin directory by passing it as the argument
    "   - e.g. `call plug#begin('~/.vim/plugged')`
    "   - Avoid using standard Vim directory names like 'plugin'

    " Make sure you use single quotes

    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-syntastic/syntastic'
    Plug 'frazrepo/vim-rainbow'

    Plug 'preservim/nerdcommenter'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'}


    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    "Plug 'junegunn/vim-easy-align'

    " Any valid git URL is allowed
    "Plug 'https://github.com/junegunn/vim-github-dashboard.git'

    " Multiple Plug commands can be written in a single line using | separators
    "Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " On-demand loading
    "Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    "Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

    " Using a non-default branch
    "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

    " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    "Plug 'fatih/vim-go', { 'tag': '*' }

    " Plugin options
    "Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

    " Plugin outside ~/.vim/plugged with post-update hook
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Unmanaged plugin (manually installed and updated)
    "Plug '~/my-prototype-plugin'

    " Initialize plugin system
call plug#end()

" Airline Config ######################################
let g:airline_powerline_fonts = 1
"let g:airline_statusline_ontop = 1
"let g:airline_theme='dark'
let g:airline_theme='simple'
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#formatter = 'jsformatter'
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Rainbow Config ################################
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" NerdCommenter Config ###########################
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1





























