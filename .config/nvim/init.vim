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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-eunuch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'

call plug#end()

set background=dark
set termguicolors

set t_Co=256

let mapleader = ","

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set colorcolumn=80

set number
set relativenumber

set splitbelow
set splitright

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set ignorecase
set smartcase

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

set autoread

let g:startify_session_dir = '~/.config/nvim/session'

set mouse=a

let g:coc_global_extensions = ['coc-tsserver', 'coc-snippets']

map <silent><c-p> :Files<cr>

let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

let g:user_emmet_leader_key='<C-Z>'

nnoremap <silent><leader>n :NERDTreeToggle<cr>
nnoremap <silent><leader>i :e ~/.config/nvim/init.vim<cr>

let g:startify_files_number = 5
let g:startify_fortune_use_unicode = 1

let g:floaterm_wintype = 'normal'
let g:floaterm_height = 0.4

let g:floaterm_keymap_new    = '<leader>f'
let g:floaterm_keymap_prev   = '[t'
let g:floaterm_keymap_next   = ']t'
let g:floaterm_keymap_toggle = '<leader>t'

autocmd FileType floaterm tnoremap <silent><buffer> <esc> <c-\><c-n>

let g:fzf_layout = { 'down': '40%' }

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

