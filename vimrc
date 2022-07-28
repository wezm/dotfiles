set nocompatible        " Use Vim defaults (much better!)
filetype off            " required for Vundle

" Build vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin()
Plug 'AndrewRadev/deleft.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ap/vim-css-color'
Plug 'arthurxavierx/vim-caser'
Plug 'barlik/Vim-Jinja2-Syntax'
Plug 'benekastah/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'davidoc/taskpaper.vim'
Plug 'edkolev/promptline.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'GEverding/vim-hocon'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'idris-hackers/idris-vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Disabled as it seems broken
" Plug 'lotabout/skim.vim' " Depends on skim plugin, which is installed with the skim package on Arch
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'lambdatoast/elm.vim'
Plug 'leafgarland/typescript-vim'
Plug 'LeonB/vim-nginx'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mg979/vim-visual-multi'
Plug 'mxw/vim-jsx'
Plug 'NoahTheDuke/vim-just'
Plug 'nono/vim-handlebars'
Plug 'osyo-manga/vim-over'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'pest-parser/pest.vim'
Plug 'rhysd/vim-crystal'
Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sirtaj/vim-openscad'
Plug 'slim-template/vim-slim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'uptech/vim-open-alternate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-utils/vim-troll-stopper'
Plug 'vmchale/dhall-vim'
Plug 'vmchale/ion-vim'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons' " need to load late to patch other plugins
Plug 'aklt/plantuml-syntax'
Plug 'wezm/vim-mercury'

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  " Plug 'autozimu/LanguageClient-neovim', {
  "     \ 'branch': 'next',
  "     \ 'do': 'bash install.sh',
  "     \ }
  Plug 'reasonml-editor/vim-reason-plus'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Completion framework
  Plug 'hrsh7th/nvim-cmp'
  " Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'L3MON4D3/LuaSnip'
  " To enable more of the features of rust-analyzer, such as inlay hints and more!
  Plug 'simrat39/rust-tools.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'RRethy/nvim-base16'
  Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
endif

call plug#end()

filetype plugin indent on      " Proper indentation and filetype plugins

set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set autoindent                 " Always set auto-indenting on
set complete-=i                " Don't complete in included files
" set completeopt=menuone,preview
set completeopt=noinsert,menuone,noselect
set shortmess+=c               " Avoid showing extra messages when using completion
set smarttab
set viminfo='20,\"500          " read/write a .viminfo file -- limit regs to 500 lines
set history=100                " keep 50 lines of command history
set laststatus=2
set ruler                      " Show the cursor position all the time
set sm                         " Show matching braces

set nrformats-=octal

set ttimeout
set ttimeoutlen=100
set updatetime=1000

" Enable (potentially insecure) modeline parsing
set modeline
set modelines=5
set showcmd
syntax enable
set expandtab
set softtabstop=2
set shiftwidth=2

set mouse=a

set number         " Line numbers
" set relativenumber " Relative line numbers
set wildmenu       " Filename completion menu
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.o,.git,tmp,node_modules,*.pyc

" Windows
set winheight=24

" Folding
set foldmethod=syntax
set foldlevelstart=2
set nofoldenable

" Show characters for expanded TABs, etc
set list
set listchars=tab:>-,trail:.,extends:>

set scrolloff=1
set display+=lastline
set lazyredraw " don't redraw during macros, etc.

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set autoread

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme base16-default-dark

set colorcolumn=100
set signcolumn=yes " Always show sign column

set sessionoptions-=options

set guioptions-=T " Hide toolbar
set guioptions-=t " No tear off menus

" Open split windows below or to the right
set splitbelow
set splitright

" Persistent undo
let s:undodir = $HOME . "/.vimundo"
if !isdirectory(s:undodir)
    call mkdir(s:undodir, "", 0700)
endif
let &undodir=s:undodir
set undofile

" Allow editing past the end of link in visual block mode
set virtualedit=block

" Confirm when attempting to abondon unsaved changes
set confirm

" Allow switching buffers when there are unsaved changes
set hidden

"Typo corrections
iab acn        can
iab ahve       have
iab amke       make
iab beacuse    because
iab becuase    because
iab Chnage     Change
iab chnage     change
iab chnaged    changed
iab ChnageLog  ChangeLog
iab chnagelog  changelog
iab Chnages    Changes
iab chnages    changes
iab cna        can
iab databse    database
iab Debain     Debian
iab debain     debian
iab Defualt    Default
iab defualt    default
iab differnt   different
iab diffrent   different
iab Emial      Email
iab emial      email
iab erturn     return
iab figth      fight
iab figther    fighter
iab flase      false
iab fro        for
iab fucntion   function
iab glpyh      glyph
iab Glpyh      Glyph
iab homepgae   homepage
iab locatoin   location
iab logifle    logfile
iab lokk       look
iab lokking    looking
iab Mial       Mail
iab mial       mail
iab miantainer maintainer
iab mroe       more
iab nwe        new
iab obnsolete  obsolete
iab pritn print
iab recieve    receive
iab recieved   received
iab Recrusive  Recursive
iab recrusive  recursive
iab retrun     return
iab retunr     return
iab seperate   separate
iab shoudl     should
iab should_receieve should_receive
iab should_recieve should_receive
iab soem       some
iab taht       that
iab teh        the
iab tehy       they
iab thta       that
iab truely     truly
iab versnio    version
iab waht       what
iab whic       which
iab whihc      which
iab wiht       with
iab yuo        you

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=utf-8,latin1
endif

" Enable better % matching (for example ruby blocks)
if has("eval")
    runtime! macros/matchit.vim
endif

" Mapping ESC in insert mode and command mode to double j
imap JJ <C-[>
cmap JJ <C-[>

" I don't use Ex mode, so use Q for formatting
map Q gq

" Map Y to yank to end of line
map Y y$

" Stop the surround plugin from stealing 's' in visual mode
xmap <Leader>s <Plug>Vsurround
map <Leader>q <Plug>Csurround "'
map <Leader>Q <Plug>Csurround '"

" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Disable the fscking F1 key, make it esc instead (thanks dgoodlad)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <F4> :noh<CR>
map <F5> @:<CR>

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

let g:xml_syntax_folding=1

" Lusty explorer options
let g:LustyJugglerSuppressRubyWarning = 1

" Use ripgrep when available
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-heading' " ack.vim
endif

" highlightedyank
let g:highlightedyank_highlight_duration = 250

" investigate.vim
let g:investigate_command_for_ruby = '^i!/usr/bin/zeal ruby:^s'
let g:investigate_command_for_rust = '^i!/usr/bin/zeal rust:^s'

" markdown-composer
" Don't automatically open browser when loading a Markdown file
let g:markdown_composer_autostart = 0
" let g:markdown_composer_syntax_theme = 'tomorrow-night'

if has("autocmd")
  au  BufNewFile,BufRead *.mustache set syntax=mustache

  " Automatically generate tag files
  "au BufWritePost *.c,*.cpp,*.h,*.rb,*.py silent! !ctags -R &

  au BufRead,BufNewFile *.go set filetype=go
  au BufRead,BufNewFile *.mun set filetype=mun
  au BufRead,BufNewFile *.tera set filetype=jinja

  " reload vimrc when written
  autocmd! bufwritepost .vimrc source %

  " Enable spell checking in git commits and markdown
  autocmd Filetype gitcommit setlocal spell
  autocmd Filetype markdown setlocal spell
  " autocmd Filetype markdown call deoplete#disable()

  " Use 4 spaces in JavaScript and TypeScript
  autocmd Filetype typescript,javascript,javascript.jsx setlocal sw=4

  " Set foldmethod to indentation for CoffeeScript files
  autocmd BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent

  au FileType slim IndentLinesEnable
  au FileType coffee IndentLinesEnable

  " autocmd BufNewFile,BufReadPost *.go setlocal listchars="tab:> ,trail:.,extends:>"

  autocmd Filetype mercury set colorcolumn=80
endif

" Ctags {
    set tags=./tags;/,~/.vimtags
" }

" NerdTree {
    " map <C-E> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <Leader>e :NERDTreeFind<CR>
    map <Leader>t :NERDTreeToggle<CR>
    map <Leader>m :NERDTreeMirror<CR>
    " nmap <leader>nt :NERDTreeFind<CR>

    let NERDSpaceDelims=1
    let NERDTreeChDirMode=0
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeMouseMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowBookmarks=1
    let NERDTreeShowHidden=1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Tabularize {
    " nmap <Leader>a& :Tabularize /&<CR>
    " vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    " nmap <Leader>a: :Tabularize /:<CR>
    " vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1

" Shell prompt generator config
let g:promptline_preset = {
      \'b' : [ '%T' ],
      \'c' : [ promptline#slices#cwd() ],
      \'y' : [ promptline#slices#vcs_branch() ],
      \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#jobs() ]}

" convert old ruby hash syntax
command! ConvertHashSyntax :%s/:\([^ ]*\)\(\s*\)=>/\1:/g | noh
" convert current file from ERB to Slim
command! Erb2slim :%!erb2slim % -
" edit vimrc
command! Vimrc :tabe ~/.vimrc
" edit README
command! Readme :tabe README.md
" read PKBUILD sha256sums
command! Sha256Sums :r! makepkg -g 2>/dev/null

" Fathom conversion commands
" convert text pasted from OpenType spec to fathom
function FathomConvert() range
    execute a:firstline . ',' . a:lastline .
      \ 's/\vuint([0-9]{2})/u\1be/e'
    execute a:firstline . ',' . a:lastline .
      \ 's/\vint([0-9]{2})/s\1be/e'
    execute a:firstline . ',' . a:lastline .
      \ 's/\(\w\+\)\s\+\([a-zA-Z0-9_\[ \]\.]\+\)\s\+\(.*\)/\/\/\/ \3\r\2<- \1,/e'
    noh
endfunction

" convert spec array to fathom array
function FathomArray() range
    execute a:firstline . ',' . a:lastline .
      \ 's/\[\([^]]\+\)\] <- \([^,]\+\)/ <- array16 \1 \2/'
    noh
endfunction

nmap <Leader>fa :call FathomArray()<CR>
vmap <Leader>fs :call FathomConvert()<CR>

" SuperTab
" Use completion context to determin the completion mechanism to use. For
" example when on a . complete methods, when on a / complete paths
let g:SuperTabDefaultCompletionType = 'context'
if has("autocmd") && exists("+omnifunc")
  " Fall back on syntaxcomplete if omnifunc is not defined
  " https://github.com/vim-scripts/SyntaxComplete
  autocmd Filetype *
      \ if &omnifunc == '' |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

  " Get SuperTab to use omnifunc when available, fall back on keyword
  " completion
  autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif
endif


" fzf {
    set rtp+=/usr/local/opt/fzf

    if has('nvim')
      let $FZF_DEFAULT_OPTS .= ' --inline-info'
    endif

    " command! -bang -nargs=? -complete=dir Files
    "   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    " command! -bang -nargs=? -complete=dir GitFiles
    "   \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

    " nnoremap <silent> <Leader><Leader> :Files<CR>
    nnoremap <C-p>F :Files<CR>
    nnoremap <Leader><Leader> :Buffers<CR>
    nnoremap <C-p>f :GitFiles<CR>
    nnoremap <C-p>c :GitFiles?<CR>
    nnoremap <C-p>b :Buffers<CR>
    " nnoremap <C-p>f :Colors<CR>
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

    " nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
    " nnoremap <silent> <Leader>C        :Colors<CR>
    " nnoremap <silent> <Leader><Enter>  :Buffers<CR>
    " nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
    " nnoremap <silent> <Leader>h :History<CR>
    " " nnoremap <silent> q/ :History/<CR>

    " inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
    " imap <c-x><c-k> <plug>(fzf-complete-word)
    " imap <c-x><c-f> <plug>(fzf-complete-path)
    " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    " imap <c-x><c-l> <plug>(fzf-complete-line)

    " nmap <leader><tab> <plug>(fzf-maps-n)
    " xmap <leader><tab> <plug>(fzf-maps-x)
    " omap <leader><tab> <plug>(fzf-maps-o)
    "
    " command! -bang -nargs=* Rg
    "       \ call fzf#vim#grep(
    "       \   'rg --column --line-number --no-heading --color=always -- '.shellescape(<q-args>), 1,
    "       \   <bang>0 ? fzf#vim#with_preview('up:60%')
    "       \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    "       \   <bang>0)
" }

" vim-surround {
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap gA <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap gA <Plug>(EasyAlign)
" }

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#616161'

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
let g:airline#extensions#whitespace#checks = [ 'trailing' ]

" Alternate files
" Needs alt: https://github.com/uptech/alt
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" Try to automagically fix the Paste bug:
" https://github.com/neovim/neovim/issues/7994
" Courtesy of didoesdigital
" au InsertLeave * set nopaste
" Turn off paste mode and the awful <Paste> bug
nnoremap <leader>v mx:s/<Paste[>]//e<CR>:set nopaste<CR>:noh<CR>`x

" deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer']
" let g:deoplete#sources.cpp = ['buffer', 'tag']

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" LanguageClient-neovim
" https://github.com/theia-ide/typescript-language-server
" let g:LanguageClient_serverCommands = {
"     \ 'css': ['css-languageserver', '--stdio'],
"     \ 'go': ['gopls'],
"     \ 'html': ['html-languageserver', '--stdio'],
"     \ 'javascript': ['typescript-language-server', '--stdio'],
"     \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
"     \ 'json': ['json-languageserver', '--stdio'],
"     \ 'less': ['css-languageserver', '--stdio'],
"     \ 'reason': ['/home/wmoore/.local/bin/reason-language-server.exe'],
"     \ 'rust': ['rust-analyzer'],
"     \ 'sass': ['css-languageserver', '--stdio'],
"     \ 'scss': ['css-languageserver', '--stdio'],
"     \ 'typescript': ['typescript-language-server', '--stdio'],
"     \ 'mun': ['mun', 'language-server'],
"     \ }
" let g:LanguageClient_useVirtualText = 'Diagnostics'
" " let g:LanguageClient_loggingFile = expand('/tmp/LanguageClient.log')
" " let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_rootMarkers = {
"     \ 'mun': ['mun.toml'],
"     \ }


" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" disable vim-abolish mappings in favour of vim-caser
let g:abolish_no_mappings = 1

" vim-visual-multi
" https://github.com/mg979/vim-visual-multi
let g:VM_leader = "''"
