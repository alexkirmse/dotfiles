" https://github.com/VundleVim/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/vundle/
" or use
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" VIM PLUGINS

Plugin 'tomasr/molokai'  " Molokai Color
Plugin 'tpope/vim-fugitive'  " git wrapper
Plugin 'Lokaltog/vim-easymotion'  " alphabetical file nav
Plugin 'vim-airline/vim-airline'  " sexy status line
Plugin 'vim-airline/vim-airline-themes'  " themes
Plugin 'mattn/emmet-vim'  " magical html syntax shortcuts
Plugin 'airblade/vim-gitgutter'  " git diff gutter
Plugin 'scrooloose/syntastic'  "syntax checker
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/tComment'   "commenting with gc
Plugin 'kien/ctrlp.vim'  " fast file searching

" Lang support

" Ruby
Plugin 'vim-ruby/vim-ruby'  " ruby support
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-endwise'  " end after code blocks in ruby

" CSS3
Plugin 'hail2u/vim-css3-syntax'

" Sass
Plugin 'cakebaker/scss-syntax.vim'

" Javascript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

" Autocompletion Plugins
Plugin 'Raimondi/delimitMate' " insert mode auto-completion for quotes, parens, brackets

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Colors
color molokai

" Show line numbers
set number

" reload changed file
set autoread

" Search settings
set hlsearch
set ignorecase

" Airline settings

set laststatus=2   " Always show the airline
set encoding=utf-8 " Necessary to show Unicode glyphs<F4>nocompatible
" https://github.com/Lokaltog/powerline-fonts
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Syntastic Settings
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }

let g:syntastic_warning_symbol = 'WW'
let g:syntastic_error_symbol = 'EE'

" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']

" Tab Settings
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Map command-[ and command-] to indenting or outdenting
"   " while keeping the original selection in visual mode
vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>
