" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" My settings
let mapleader = ' '

" NERDTree settings
nnoremap <leader>n :NERDTreeToggle<CR>

" Fzf settings
nnoremap <c-p> :Files<cr>
