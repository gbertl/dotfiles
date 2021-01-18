" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" My settings
let mapleader = ' '

" NERDTree settings
nnoremap <leader>n :NERDTreeToggle<CR>

" Fzf settings
nnoremap <c-p> :Files<cr>

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline
