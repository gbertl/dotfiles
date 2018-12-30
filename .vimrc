call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-rails'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'

call plug#end()

set background=dark
set termguicolors
colorscheme solarized8

" fixes termguicolors
set t_Co=256

let mapleader = ","

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set relativenumber

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

set ignorecase
set smartcase

nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <leader>k :NERDTreeFromBookmark<space>

nnoremap <silent> <leader>t :CtrlP<cr>
nnoremap <silent> <leader>b :CtrlPBuffer<cr>

tnoremap <esc> <c-\><c-n>

" list all buffer at the top and show only filenames
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" enable > 
let g:airline_powerline_fonts = 1

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" make ctrlp open based on nerdtree working dir
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
  let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --vimgrep'
endif

let NERDTreeMinimalUI=1

set hid

set diffopt+=vertical

let NERDTreeAutoDeleteBuffer = 1

set nohlsearch

nnoremap ; :
vnoremap ; :

let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

nnoremap <leader>gg :Git!<space>
nnoremap <silent> <leader>gl :Git log --oneline<cr>

nnoremap <silent> <leader>ve :e ~/.vimrc<cr>

map \ <Plug>(easymotion-prefix)
