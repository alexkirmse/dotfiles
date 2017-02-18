" Run the following on the terminal to make vim font thinner in MacVim
"
" defaults write org.vim.MacVim AppleFontSmoothing -int 0

set nocompatible              " be iMproved, required
scriptencoding utf-8
set termguicolors

" vim-plug - https://github.com/junegunn/vim-plug
" https://github.com/junegunn/vim-plug/wiki/faq#migrating-from-other-plugin-managers

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start Plugins
call plug#begin('~/.vim/bundle')

" VIM PLUGINS

Plug 'tomasr/molokai'  " Molokai Color
Plug 'joshdick/onedark.vim'  " One Dark Color
Plug 'tpope/vim-fugitive'  " git wrapper
Plug 'Lokaltog/vim-easymotion'  " alphabetical file nav
Plug 'vim-airline/vim-airline'  " sexy status line
Plug 'vim-airline/vim-airline-themes'  " themes
Plug 'mattn/emmet-vim'  " magical html syntax shortcuts
Plug 'airblade/vim-gitgutter'  " git diff gutter
Plug 'scrooloose/syntastic'  "syntax checker
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/tComment'   "commenting with gc
Plug 'kien/ctrlp.vim'  " fast file searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " alternate fuzzy file searching
Plug 'junegunn/fzf.vim'

" Lang support

" Ruby
Plug 'vim-ruby/vim-ruby'  " ruby support
Plug 'tpope/vim-endwise'  " end after code blocks in ruby

" CSS3
Plug 'hail2u/vim-css3-syntax'

" Sass
Plug 'cakebaker/scss-syntax.vim'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

" Autocompletion Plugins
Plug 'Raimondi/delimitMate' " insert mode auto-completion for quotes, parens, brackets

call plug#end()
" End of plugin references


" Colors
" color molokai
color onedark

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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
