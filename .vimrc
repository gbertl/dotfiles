call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --ts-completer --clang-completer --rust-completer' }
Plug 'tpope/vim-rails'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-eunuch'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-syntastic/syntastic'

call plug#end()

set background=dark
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" fixes termguicolors
set t_Co=256

let mapleader = " "

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
set colorcolumn=80

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

set ignorecase
set smartcase

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>k :NERDTreeFromBookmark<space>

tnoremap <esc> <c-\><c-n>

" list all buffer at the top and show only filenames
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" enable > 
let g:airline_powerline_fonts = 1

let g:airline_theme='minimalist'

" make ctrlp open based on nerdtree working dir
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
  let g:ackprg = 'ag --vimgrep'
endif

let NERDTreeMinimalUI=1

set hid

let NERDTreeAutoDeleteBuffer = 1

set nohlsearch

let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

nnoremap <silent> <leader>gst :Gstatus<cr>
nnoremap <leader>gri :Grebase -i<space>
nnoremap <leader>gsp :Gsplit<space>
nnoremap <silent> <leader>gpf :Gpush -f<cr>

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []

nnoremap <leader>a :Ack!<space>

nnoremap <silent> <leader>f :NERDTreeFind<cr>

let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_bufTypeExclude = ['help']

nnoremap \ ,
vnoremap \ ,

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

set completeopt-=preview

let g:ycm_show_diagnostics_ui = 0

let g:indentLine_fileTypeExclude = ['json']

set mouse=a

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set autoread

let g:startify_session_dir = '~/.vim/session'

set mouse=a
