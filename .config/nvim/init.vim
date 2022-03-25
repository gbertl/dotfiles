" Plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

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
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab

set ignorecase smartcase " search case insensitively & smartly
set termguicolors
set nobackup nowritebackup noswapfile " since most stuff is in SVN, git etc. anyway
set signcolumn=yes
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set colorcolumn=80
set cursorline

" My settings
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

" Airline settings
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Emmet settings
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

" Gruvbox-material settings
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

" Telescope settings
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

" Easymotion settings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)

" Tree settings
nnoremap <silent><C-n> :NvimTreeToggle<CR>
nnoremap <silent><leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_indent_markers = 1

lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "<C-v>",                        cb = tree_cb("vsplit") },
  { key = "<C-x>",                        cb = tree_cb("split") },
  { key = "<C-t>",                        cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "m",                            cb = tree_cb("system_open") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}

require('nvim-tree').setup({
  hijack_cursor = true,
  view = {
    mappings = {
      custom_only = true,
      list = list
    }
  }
})
EOF

" indent-blankline settings
lua << EOF
require("indent_blankline").setup {
  buftype_exclude = {"help"}
}
EOF

" vim-css3-syntax settings
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
