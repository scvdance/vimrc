" Standard vim options
set autoindent            " Always set autoindenting on
set backspace=2           " Allow backspacing over everything in insert mode
set guioptions-=m         " Remove menu from the gui
set guioptions-=T         " Remove toolbar
set hidden                " hide buffers instead of closing
set history=50            " keep 50 lines of command line history
set ignorecase            " Do case insensitive matching
set incsearch             " Incremental search
set hlsearch              " Highlight search
set laststatus=2          " Always have status bar
set nobackup              " Don't keep a backup file
set nocompatible          " Use Vim defaults (much better!)
set nofen                 " Disable folds
set ruler                 " The ruler on the bottom is useful
set tabstop=2
set shiftwidth=2          " Set indention level to be the same as softtabstop
set expandtab             " Get rid of tabs altogether and replace with spaces
set softtabstop=2         " Why are tabs so big?  This fixes it
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set matchtime=10          " Time to flash the brack with showmatch
set virtualedit=block     " Let blocks be in virutal edit mode
set laststatus=2          " Show a status line even when only one window is shown 
set number                " Set line numbers
set scrolloff=80          " Don't let the curser get too close to the edge

" The following setting allow vim to exit intert node on ESC key immediately
set notimeout             " No timeout on the keys that send escape sequence
set ttimeout              " timeout on key-codes
set ttimeoutlen=100       " timeout on key-codes after 100ms

" Longer Set options
set listchars=tab:>-,trail:-                 " prefix tabs with a > and trails with -
set whichwrap+=<,>,[,],h,l,~                 " arrow keys can wrap in normal and insert modes

set wildmenu              " This is used with wildmode(full) to cycle options
set wildmode=list:longest,full               " list all options, match to the longest

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

:let mapleader=","

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Git integration
Bundle 'tpope/vim-fugitive'
" Easymotion 
Bundle 'Lokaltog/vim-easymotion'
" Search results counter
Bundle 'IndexedSearch'
" Color Schemes
Bundle 'flazz/vim-colorschemes'
" Add buffer explorer
Bundle 'jlanzarotta/bufexplorer'
" Play nice with external tools
Bundle 'scrooloose/syntastic'
" Enable the javascript syntax
Bundle 'pangloss/vim-javascript'
" Grep code in Vim
Bundle 'mileszs/ack.vim'
" Airline 
Bundle 'bling/vim-airline'
" JSON syntax highlighting
Bundle 'elzr/vim-json'
" Python indentation
Bundle 'hynek/vim-python-pep8-indent'

" Disable concealing of double quotes
let g:vim_json_syntax_conceal = 0

" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified=1

" Ag and Ack options
" Highlight search terms
let g:ackhighlight = 1

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
filetype indent on
syntax on

" Silver Searcher
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" NERDTree (better file browser) toggle
map <F2> :NERDTreeFind<CR>
map <F3> :NERDTreeToggle<CR>
nmap ,b :Bookmark<CR>
let NERDTreeWinSize=40
let NERDTreeMinimalUI=1

" Tab related shortcuts
nmap ,m :tabnext<CR>
nmap ,n :tabprevious<CR>

" Buffer related shortcuts
nmap ,f :bn<CR>
nmap ,d :bp<CR>

" Window related shortcuts
nmap ,w <C-w>w
nmap ,v <C-w>v
nmap ,s <C-w>s

" Buffer Explorer
" Tips
" Use Ctrl-O to jump back to the previous buffer
" User Ctrl-I to jump forward to the next buffer
nmap <silent> ,. :BufExplorer<CR>

" Format JSON to a pretty print style
nmap <silent> ,j :%!python -m json.tool<CR>

" CtrlP (new fuzzy finder)

" Change the command to invoke Control-P with ctrl-p
let g:ctrlp_map = '<c-p>'
" This sets the default search to file name search
let g:ctrlp_by_filename = 1
" This sets the default behavior as open files in tab
let g:ctrlp_switch_buffer = 'Et'

" Setting the custom root. The root that contains '.custom' directory is the root.
" let g:ctrlp_root_markers = ['.custom']

" This sets the files to ignore.
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

" Settings for js-beautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<CR>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<CR>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" Syntastic syntax checking configuration
"
" To always show the error list: 
" let g:syntastic_auto_loc_list = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Settings to make the smooth scroll
:map <C-U> <C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E>

set background=dark
colorscheme molokai

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
