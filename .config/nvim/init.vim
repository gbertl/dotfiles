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
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

call plug#end()

" General settings
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set hidden
set nohlsearch
set splitbelow splitright

" My settings
let mapleader = ' '

" NERDTree settings
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" Fzf settings
nnoremap <silent> <c-p> :Files<cr>

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline

" Nord settings
colorscheme nord

" Emmet settings
let g:user_emmet_leader_key='<C-Z>'

" CoC settings
let g:coc_global_extensions = ['coc-emmet', 'coc-snippets', 'coc-tsserver', 'coc-eslint', 'coc-prettier']

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" CoC Prettier settings
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Startify settings
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions'] },
      \ { 'type': 'files',     'header': ['   Recent files'] },
      \ ]
