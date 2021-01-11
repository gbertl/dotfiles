call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
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
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/0.x'
  \ }

call plug#end()

set background=dark
set termguicolors

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

" list all buffer at the top and show only filenames
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='minimalist'

let g:NERDTreeChDirMode       = 2

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

let g:indentLine_bufNameExclude = ['NERD_tree.*']
let g:indentLine_bufTypeExclude = ['help']

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

set completeopt-=preview

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

let g:startify_session_dir = '~/.config/nvim/session'

set mouse=a

let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-snippets']

map <silent><c-p> :Files<cr>
let $FZF_DEFAULT_OPTS="--layout reverse"

let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

let g:user_emmet_leader_key='<C-Z>'

" Leader mappings
nnoremap <silent><leader>n :NERDTreeToggle<cr>
nnoremap <silent><leader>f :NERDTreeFind<cr>
nnoremap <silent><leader>i :e ~/.config/nvim/init.vim<cr>

nnoremap <silent><c-t> :Buffers<cr>

let g:startify_files_number = 5
let g:startify_custom_indices = ['l',';','f','d','s','a','h','g']
