" Plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-obsession'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/gruvbox-material'
Plug 'jparise/vim-graphql'
Plug 'windwp/nvim-spectre'

call plug#end()

" General config
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set hidden
set nohlsearch
set splitbelow splitright
set mouse=a

" tabwidths
set tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.html set filetype=html

set ignorecase smartcase " search case insensitively & smartly
set termguicolors
set nobackup nowritebackup noswapfile " since most stuff is in SVN, git etc. anyway
set signcolumn=yes
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set colorcolumn=80
set cursorline

" My config
let mapleader = ','

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

" Airline config
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Emmet config
let g:user_emmet_expandabbr_key='<leader>,'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" CoC config
let g:coc_global_extensions = [
\   'coc-snippets',
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-prettier',
\   'coc-css',
\]

set updatetime=300

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

nmap <silent> [j <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]j <Plug>(coc-diagnostic-next-error)

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

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Telescope config
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
require('telescope').load_extension('fzf')
EOF

" Tree config
nnoremap <silent><C-n> :NvimTreeToggle<CR>
nnoremap <silent><leader>n :NvimTreeFindFile<CR>

lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require('nvim-tree').setup({
  hijack_cursor = true,
  view = {
    adaptive_size = true,
    hide_root_folder = true,
  }
})
EOF

" indent-blankline config
lua << EOF
require("indent_blankline").setup {
  buftype_exclude = {"help"},
  bufname_exclude = {"NvimTree_1"}
}
EOF

" vim-css3-syntax config
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

" treesitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "html", 
    "javascript", 
    "typescript", 
    "tsx", 
    "json", 
    "lua",
    "vim",
    "graphql"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
EOF

" gruvbox-material config
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

" spectre
nnoremap S <cmd>lua require('spectre').open()<CR>

"search current word
nnoremap sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre
