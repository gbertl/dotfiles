" Plugins
call plug#begin()

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
Plug 'tweekmonster/django-plus.vim'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-obsession'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

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
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set colorcolumn=80

" My settings
let mapleader = ','

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <leader>i :vs ~/.config/nvim/init.vim<cr>

" buffer switching
nnoremap <silent>gn :bn<cr>
nnoremap <silent>gp :bp<cr>
nnoremap <silent>g0 :bf<cr>
nnoremap <silent>g$ :bl<cr>

" closing buffer
nnoremap <silent>go :%bd\|e#\|bd#<cr>
nnoremap <silent>gx :bd<cr>
nnoremap <silent>X :e#<cr>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" emmet
let g:user_emmet_expandabbr_key='<leader>,'
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
\   'coc-tailwindcss',
\]

set updatetime=300

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent><leader>f <Plug>(coc-format)

nmap <silent>gd <Plug>(coc-definition)

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
let g:indentLine_fileTypeExclude = ['help']
let g:indentLine_char = '│'

" Gruvbox-material settings
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

" telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

lua << EOF
require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        preview_cutoff = 1,
        prompt_position = "top",
        mirror = true,
        width = 0.6
      }
    },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  },
})
EOF

" easymotion
let g:EasyMotion_do_mapping = 0
nmap <space> <Plug>(easymotion-overwin-f2)
map \ <Plug>(easymotion-s2)

" Tree settings
nnoremap <silent><C-n> :NvimTreeToggle<CR>
nnoremap <silent><leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1

lua << EOF
require('nvim-tree').setup({
  auto_close = true,
  hijack_cursor = true,
})
EOF
