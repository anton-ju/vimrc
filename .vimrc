" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'python-rope/ropevim'
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'integralist/vim-mypy'

" Initialize plugin system
call plug#end()
"
"
" Theme options
set t_Co=256
colorscheme Monokai
set background=dark    " Setting dark mode
""" Hilight search and set numbers
set hlsearch
highlight Search guibg=#af005f ctermbg=125
"""" clear highlight with <esc> after a search
nnoremap <C-h> :noh<return>
inoremap jk <esc>

set cc=120

set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files

" Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" Nerdtree configuration
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Switching between buffers
" Set commands to switching between buffers
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>
nnoremap <C-X> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap ,<space> :nohlsearch<CR>

" File searchs
map <C-p> :Files<CR>

" Ale Configuration
"""" Better formatting fo worp/ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%...code...%]'
"""" Enable completion where available.
let g:ale_completion_enabled = 0
""" Customize linters that are turned on
let g:ale_linters = {
	\   'python': ['flake8'],
	\}
let g:ale_set_highlights = 0
let g:ale_python_flake8_options = '--max-line-length=99'
" Fix keys
set backspace=2

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']

nmap <F8> :TagbarToggle<CR>

" emmet-vim config
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Y>'

" use tidy to clean up html
:vmap ,x :!tidy -q -i --wrap 0 --show-errors 0 --doctype omit --show-body-only yes --fix-uri no<CR>

" ropevim
let ropevim_vim_completion=1
let ropevim_extended_complete=1
