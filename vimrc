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
Plug 'benekastah/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'davidoc/taskpaper.vim'
Plug 'edkolev/promptline.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular'
Plug 'itspriddle/vim-marked'
Plug 'janko-m/vim-test'
Plug 'jreybert/vimagit', { 'branch': 'next' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'keith/investigate.vim'
Plug 'lambdatoast/elm.vim'
Plug 'LeonB/vim-nginx'
Plug 'machakann/vim-highlightedyank'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'nono/vim-handlebars'
Plug 'osyo-manga/vim-over'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sirtaj/vim-openscad'
Plug 'sjl/gundo.vim'
Plug 'slim-template/vim-slim'
Plug 'smerrill/vcl-vim-plugin'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-utils/vim-troll-stopper'
call plug#end()

filetype plugin indent on      " Proper indentation and filetype plugins

set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set autoindent                 " Always set auto-indenting on
set complete-=i                " Don't complete in included files
set smarttab
set viminfo='20,\"500          " read/write a .viminfo file -- limit regs to 500 lines
set history=50                 " keep 50 lines of command history
set laststatus=2
set ruler                      " Show the cursor position all the time
set sm                         " Show matching braces

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" Enable (potentially insecure) modeline parsing
set modeline
set modelines=5
set showcmd
syntax enable
set expandtab
set softtabstop=2
set shiftwidth=2

set mouse=a

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set number         " Line numbers
set relativenumber " Relative line numbers
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

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set colorcolumn=100

set sessionoptions-=options

set guioptions-=T " Hide toolbar
set guioptions-=t " No tear off menus

" Open split windows below or to the right
set splitbelow
set splitright

" Persistent undo 7.3 onwards
if exists("+undofile")
  set undofile
  set undodir=~/.vimundo,.
endif

" Allow editing past the end of link in visual block mode
set virtualedit=block

"Typo corrections
iab acn        can
iab ahve       have
iab amke       make
iab beacuse    because
iab becuase    because
iab centre     center
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
iab homepgae   homepage
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
iab should_recieve should_receive
iab should_receieve should_receive
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
nnoremap <leader>y "*y
vnoremap <leader>y "*y

" Disable the fscking F1 key, make it esc instead (thanks dgoodlad)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Lusty explorer options
let g:LustyJugglerSuppressRubyWarning = 1

" CommandT options
let g:CommandTMaxDepth = 20
let g:CommandTMaxFiles = 20000

" CtrlP options
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 20

" UltiSnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

if has("autocmd")
  au  BufNewFile,BufRead *.mustache set syntax=mustache

  " Automatically generate tag files
  "au BufWritePost *.c,*.cpp,*.h,*.rb,*.py silent! !ctags -R &

  au BufRead,BufNewFile *.go set filetype=go

  " reload vimrc when written
  autocmd! bufwritepost .vimrc source %

  " Get SuperTab to use omnifunc when available
  " autocmd FileType *
  "   \ if &omnifunc != '' |
  "   \   call SuperTabChain(&omnifunc, "<c-p>") |
  "   \ endif
endif

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

if has("autocmd")
  " Enable spell checking in git commits
  autocmd Filetype gitcommit setlocal spell
endif

" Ctags {
    set tags=./tags;/,~/.vimtags
" }

" NerdTree {
    map <C-E> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <Leader>e :NERDTreeFind<CR>
    map <Leader>e :NERDTreeFind<CR>
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

" TagBar {
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
"}

" Gundo
nnoremap <Leader>u :GundoToggle<CR>

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
" convert double to single quoted strings
command! ConvertDoubleQuotes :%s/"\([^"'#]*\)"/'\1'/g | noh
" convert current file from ERB to Slim
command! Erb2slim :%!erb2slim % -
" edit vimrc
command! Vimrc :e ~/.vimrc

" SuperTab
" Try omnicompletion if available, fall back to keywork completion
"let g:SuperTabDefaultCompletionType = 'context'

" fzf {
    set rtp+=/usr/local/opt/fzf

    if has('nvim')
      let $FZF_DEFAULT_OPTS .= ' --inline-info'
    endif

    " nnoremap <silent> <Leader><Leader> :Files<CR>
    nnoremap <C-p>F :Files<CR>
    nnoremap <C-p>f :GitFiles<CR>
    nnoremap <C-p>c :GitFiles?<CR>
    nnoremap <C-p>b :Buffers<CR>
    " nnoremap <C-p>f :Colors<CR>
    nnoremap <C-p>a :Rg 
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
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)
" }

" vim-surround {
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
" }
