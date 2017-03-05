" Run the following on the terminal to make vim font thinner in MacVim
"
" defaults write org.vim.MacVim AppleFontSmoothing -int 0

set nocompatible              " be iMproved, required
scriptencoding utf-8

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
Plug 'rakr/vim-one'  " Vim One Dark Color
Plug 'tpope/vim-fugitive'  " git wrapper
Plug 'Lokaltog/vim-easymotion'  " alphabetical file nav
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

" JS Autocomplete plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Autocompletion Plugins
"Plug 'Raimondi/delimitMate' " insert mode auto-completion for quotes, parens, brackets

call plug#end()
" End of plugin references

" Deoplete config
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Supertab and Autocomplete
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Colors
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Cursor behavior (insert, edit)
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" insert mode - line
let &t_SI .= "\<Esc>[5 q"
"replace mode - underline
let &t_SR .= "\<Esc>[4 q"
"common - block
let &t_EI .= "\<Esc>[3 q"


set background=dark " for the dark version
" set background=light " for the light version
colorscheme one

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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'
" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn
" Run NeoMake after save
autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

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

" FZF ctrl-p keybindings http://www.devinrm.com/blog/2016/02/16/ditching-ctrl-p
" Fuzzy-find with fzf
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>

" View commits in fzf
nmap <Leader>c :Commits<cr>
