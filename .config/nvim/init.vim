let maplocalleader = " "
" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Plug 'liuchengxu/vim-better-default'
Plug 'easymotion/vim-easymotion'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'ncm2/float-preview.nvim'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }
Plug 'w0rp/ale'
Plug 'Olical/conjure', { 'tag': 'v4.3.1' }
" Conjure support - jack-in with nrepl dependencies
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'mhinz/vim-startify'
"" Version control plugins
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" File management
" " https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" Completion support
Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
"
" Spaceline.vim - Status line themes
""Plug 'hardcoreplayers/spaceline.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" --------theme ----------------------------------
""Plug 'morhetz/gruvbox'
""Plug 'lifepillar/vim-solarized8' 
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" --------theme ----------------------------------
call plug#end()

syntax on
set t_Co=256
colorscheme onehalflight
set smarttab
set softtabstop=4
set nornu
set number

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let mapleader = " "

nnoremap <C-n> :NERDTree<CR>
nnoremap <Leader>op :NERDTreeToggle<CR>
let NERDTreeMapUpdir='g'
let NERDTreeMapCustomOpen='<TAB>'

nnoremap <Leader>ws <C-W>h
nnoremap <Leader>wn <C-W>j
nnoremap <Leader>we <C-W>k
nnoremap <Leader>wt <C-W>l
nnoremap <Leader>wv <C-W>v
nnoremap <Leader>wd :q
nnoremap <Leader>ww <C-W>w

nmap <Leader>rp :TagbarToggle<CR>

let g:lightline = { 'colorscheme': 'onehalfdark' }
let g:airline_powerline_fonts = 1
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set completeopt-=preview
""let g:float_preview#docked = 0
""let g:float_preview#max_width = 80
""let g:float_preview#max_height = 40

set termguicolors

let g:coc_global_extensions = ['coc-conjure']
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let g:coc_watch_extensions = ['coc-conjure']


nnoremap <leader>pf <cmd>Telescope find_files<CR>
nnoremap <leader>/ <cmd>Telescope live_grep<CR>
nnoremap <leader>bb <cmd>Telescope buffers<CR>
nnoremap <leader>hh <cmd>Telescope help_tags<CR>














let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker']
      \}

 

" === Colemak Mod-DHM ===
"Colemak mnei(hjkl) t(i) <C-n>(f) <C-e>(e)
noremap s h|        "move Left
noremap n gj|       "move Down
noremap e gk|       "move Up
noremap t l|        "move Right
noremap E e|        "end of word      replaces (e)nd
noremap h n|        "next match       replaces (n)ext
noremap h N|        "previous match   replaces (N) prev
noremap <C-m> m|    "mark             replaces (m)ark
 
noremap <C-n> <C-f>| "Page down
noremap <C-e> <C-b>H| "Page up, cursor up
 
" below: not remapping, just fixing sequences:
" fix (i)nner and (t)ill, e.g. (c)hange (i)n (w)ord
nnoremap ci ci|
nnoremap di di|
nnoremap vi vi|
nnoremap yi yi|
nnoremap ct ct|
nnoremap dt dt|
nnoremap vt vt|
nnoremap yt yt|

let NERDTreeMapOpenExpl='p'
" === Colemak Mod-DHM ===
