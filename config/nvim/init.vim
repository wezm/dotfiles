source ~/.vimrc

" Interactive substitute
set inccommand=split

" Easier terminal navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" vim-test
let test#strategy = 'neoterm'
let test#ruby#bundle_exec = 0
nnoremap <silent> ,rt :TestSuite<cr>
nnoremap <silent> ,rf :TestFile<cr>
nnoremap <silent> ,rn :TestNearest<cr>
nnoremap <silent> ,rr :TestLast<cr>

" Useful maps
" closes the all terminal buffers
nnoremap <silent> ,tc :call neoterm#close_all()<cr>
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tk :call neoterm#kill()<cr>

" neoterm/neovim terminal
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = '24'
let g:neoterm_autoscroll = 1
tnoremap JJ <C-\><C-n>

" NeovimGtk
if exists('g:GtkGuiLoaded')
  " Use GTK  clipboard
  let g:GuiInternalClipboard = 1
  " Disable native popup an use vim one instead
  call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
endif

" Neomake
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)

" reload when written
autocmd! bufwritepost init.vim source %

" check files when focused again (probably only works in NeovimGtk)
autocmd BufEnter,FocusGained * checktime
