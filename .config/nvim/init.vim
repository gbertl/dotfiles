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
Plug 'sainnhe/gruvbox-material'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'ap/vim-css-color'
Plug 'tweekmonster/django-plus.vim'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-obsession'

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
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

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

nnoremap <silent> <leader>i :vs ~/.config/nvim/init.vim<cr>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <silent><leader>o :%bd\|e#\|bd#<cr>

" NERDTree settings
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

let NERDTreeMinimalUI=1 " hides help line at the top
let g:NERDTreeChDirMode = 2 " auto change the CWD
let g:NERDTreeAutoDeleteBuffer = 1

" Fzf settings
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-t> :Buffers<cr>
let $FZF_DEFAULT_OPTS="--layout reverse"

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

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
\   'coc-pyright',
\]

set updatetime=300

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent><leader>f <Plug>(coc-format)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" indentLine settings
let g:indentLine_fileTypeExclude = ['startify', 'help', 'fugitive']
let g:indentLine_char = '│'

" Gruvbox-material settings
colorscheme gruvbox-material

" Fugitive settings
nnoremap <silent><leader>g :vertical G<cr>
