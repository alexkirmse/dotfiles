set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search

set expandtab               " converts tabs to white space
set tabstop=2               " number of columns occupied by a tab
set shiftwidth=2            " width for autoindents
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing

set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set background=dark         " Dark version
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file

" Automatic installation of vim-plug (if not installed)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" VIM PLUGINS
call plug#begin(stdpath('data') . '/plugged')

    Plug 'tomasr/molokai'  " Molokai Color
    Plug 'joshdick/onedark.vim'  " One Dark Color
    Plug 'rakr/vim-one'  " Vim One Dark Color
    Plug 'tpope/vim-fugitive'  " git wrapper
    Plug 'Lokaltog/vim-easymotion'  " alphabetical file nav
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'  " sexy status line
    Plug 'vim-airline/vim-airline-themes'  " themes
    Plug 'mattn/emmet-vim'  " magical html syntax shortcuts
    Plug 'airblade/vim-gitgutter'  " git diff gutter
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'vim-scripts/tComment'   "commenting with gc
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " alternate fuzzy file searching
    Plug 'junegunn/fzf.vim'
    Plug 'neomake/neomake' "async linting
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "autocomplete
    Plug 'ervandew/supertab'

    " Lang support

    " CSS3
    Plug 'hail2u/vim-css3-syntax'

    " Sass
    Plug 'cakebaker/scss-syntax.vim'

    " Javascript
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jelera/vim-javascript-syntax'
    Plug 'pangloss/vim-javascript'
call plug#end()

" Color schemes
 if (has("termguicolors"))
   set termguicolors
 endif
colorscheme one

