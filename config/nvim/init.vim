source ~/.vimrc

" Interactive substitute
set inccommand=split

" GNvim -- https://github.com/vhakulinen/gnvim
if exists('g:gnvim')
  set guifont=PragmataProMonoLiga:h9.5
  " set GnvimCursorEnableAnimations 0
  " call gnvim#cursor#enable_animations(0)
  call rpcnotify(g:gnvim_channel_id, 'Gnvim', 'EnableCursorAnimations', 0)
endif

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
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = '24'
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

" LuaSnip
lua require('snippets')
imap <silent><expr> <C-\> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-\>'
inoremap <silent> <S-C-\> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-\> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-C-\> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'


" reload when written
autocmd! bufwritepost init.vim source %

" check files when focused again (probably only works in NeovimGtk)
autocmd BufEnter,FocusGained * checktime

lua require('lsp')
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

lua require('completion')
