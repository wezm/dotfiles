" === Plugins ===

call plug#begin()

Plug 'arthurxavierx/vim-caser'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mg979/vim-visual-multi'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'osyo-manga/vim-over'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Completion framework
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'

" File types
Plug 'gleam-lang/gleam.vim',   { 'for': 'gleam' }
Plug 'wezm/vim-mercury',       { 'for': 'mercury' }
Plug 'nickel-lang/vim-nickel', { 'for': 'nickel' }
Plug 'NoahTheDuke/vim-just',   { 'for': 'just' }

Plug 'ryanoasis/vim-devicons' " need to load late to patch other plugins

call plug#end()

" === Configuration ===

autocmd! BufWritePost init.vim source %

" Interactive substitute
set inccommand=split

set expandtab " expand tabs into spaces
set softtabstop=2 " 
set shiftwidth=2 " indent 2 spaces at a time
set number  " show line numbers

set ttimeout
set ttimeoutlen=100
set updatetime=1000

" Ignore these file in filename completion
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.o,.git,tmp,node_modules,*.pyc

" Minimal number of lines for the current window.
set winheight=10

set foldmethod=syntax

" Show characters for expanded TABs, etc
set list
set listchars=tab:>-,trail:.,extends:>

set lazyredraw " don't redraw during macros, etc.

set colorcolumn=100 " show a line at column 100

" Open split windows below or to the right
set splitbelow
set splitright

" Persistent undo
let s:undodir = $HOME . "/.vimundo" " FIXME: Store this in a better place like .cache or something
if !isdirectory(s:undodir)
    call mkdir(s:undodir, "", 0700)
endif
let &undodir=s:undodir
set undofile

" Allow editing past the end of link in visual block mode
set virtualedit=block

" Confirm when attempting to abondon unsaved changes
set confirm

" === Plugin Configuration

" NerdTree
map <Leader>e :NERDTreeFind<CR>
map <Leader>t :NERDTreeToggle<CR>
map <Leader>m :NERDTreeMirror<CR>

"let NERDSpaceDelims=1
"let NERDTreeChDirMode=0
"let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
"let NERDTreeKeepTreeInNewTab=1
"let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen=1
"let NERDTreeShowBookmarks=1
"let NERDTreeShowHidden=1
"let g:nerdtree_tabs_open_on_gui_startup=0

" Fzf
" set rtp+=/usr/local/opt/fzf

let $FZF_DEFAULT_OPTS .= ' --inline-info'

nnoremap <C-p>F :Files<CR>
nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <C-p>f :GitFiles<CR>
nnoremap <C-p>c :GitFiles?<CR>
nnoremap <C-p>b :Buffers<CR>
nnoremap <C-p>a :Rg 

" Search for word under cursor, c/o Di
nnoremap <silent> <Leader>w :Rg <C-R><C-W><CR>
" Search for rest of line
nmap <silent> <Leader>A Y :Rg <C-R>"<CR>

nnoremap <C-p>L :Lines<CR>
nnoremap <C-p>l :BLines<CR>
nnoremap <C-p>T :Tags<CR>
nnoremap <C-p>t :BTags<CR>
nnoremap <C-p>m :Marks<CR>
nnoremap <C-p>w :Windows<CR>
" nnoremap <C-p>f :Locate<CR>
nnoremap <C-p>h :History<CR>
nnoremap <C-p>H :History:<CR>
nnoremap <C-p>/ :History/<CR>
" nnoremap <C-p>f :Snippets<CR>
" nnoremap <C-p>f :Commits<CR>
" nnoremap <C-p>f :BCommits<CR>
" nnoremap <C-p>f :Commands<CR>
" nnoremap <C-p>f :Maps<CR>
" nnoremap <C-p>f :Helptags<CR>

" === Plugin Variables ===

" wezm/vim-mecury
let g:mercury_highlight_comment_special = 1

" mg979/vim-visual-multi
let g:VM_leader = "''"

" vim-airline/airline
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:airline#extensions#whitespace#checks = [ 'trailing' ]

" neoterm/neovim terminal
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoscroll = 1
tnoremap JJ <C-\><C-n>

" tpope/vim-abolish 
let g:abolish_no_mappings = 1 " disable mappings in favour of vim-caser

" === Mappings ===

" Map Y to yank to end of line
map Y y$

" Easier terminal navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Disable F1 showing help, make it esc instead (thanks dgoodlad)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" === Load Lua Configs ===

lua require('wm-treesitter')
lua require('wm-gitsigns')
lua require('wm-lsp')

" === Custom Commands ===

" Highlight on yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=250}
augroup END
