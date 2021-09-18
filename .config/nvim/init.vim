" Plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'sainnhe/gruvbox-material'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'

call plug#end()

" General settings
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set hidden
set nohlsearch
set splitbelow splitright
set mouse=a

" tabwidths
set tabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango setlocal tabstop=2 shiftwidth=2 expandtab

set ignorecase smartcase " search case insensitively & smartly
set termguicolors
set nobackup nowritebackup noswapfile " since most stuff is in SVN, git etc. anyway
set signcolumn=yes
autocmd FileType nerdtree setlocal signcolumn=no
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set colorcolumn=80

" My settings
let mapleader = ' '

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <leader>i :sp ~/.config/nvim/init.vim<cr>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap n nzz
nnoremap N Nzz

nnoremap <silent><leader>o :%bd\|e#\|bd#<cr>

" NERDTree settings
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

let NERDTreeMinimalUI=1 " hides help line at the top
let g:NERDTreeChDirMode = 2 " auto change the CWD

" Fzf settings
nnoremap <silent> <c-p> :Files<cr>
let $FZF_DEFAULT_OPTS="--layout reverse"

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Emmet settings
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" CoC settings
let g:coc_global_extensions = [
\   'coc-snippets',
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-htmldjango',
\]

set updatetime=300

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent><leader>f <Plug>(coc-format)

" Startify settings
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
      \ { 'type': 'files',     'header': ['   Recent files'] },
      \ ]

" indentLine settings
let g:indentLine_fileTypeExclude = ['startify', 'help', 'fugitive']
let g:indentLine_char = '│'

" Gruvbox-material settings
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
