" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" General settings
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set hidden
set nohlsearch

" My settings
let mapleader = ' '

" NERDTree settings
nnoremap <leader>n :NERDTreeToggle<CR>

" Fzf settings
nnoremap <c-p> :Files<cr>

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline

" Nord settings
colorscheme nord
