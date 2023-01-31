source ~/.vimrc

" Interactive substitute
set inccommand=split

" GNvim and reovim use this to set the font
set guifont=PragmataPro_Mono:h9.5

" GNvim -- https://github.com/vhakulinen/gnvim
if exists('g:gnvim')
  " set GnvimCursorEnableAnimations 0
  " call gnvim#cursor#enable_animations(0)
  call rpcnotify(g:gnvim_channel_id, 'Gnvim', 'EnableCursorAnimations', 0)
endif

" Neovide
if exists("g:neovide")
  let g:neovide_cursor_animation_length=0
  set guifont=PragmataPro_Mono:h12
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

" " telescope {
"   " Find files using Telescope command-line sugar.
"   nnoremap <C-p>f <cmd>Telescope git_files<cr>
"   nnoremap <C-p>F <cmd>Telescope find_files<cr>
"   nnoremap <C-p>a <cmd>Telescope live_grep<cr>
"   nnoremap <leader>w <cmd>Telescope grep_string<cr>
"   nnoremap <leader><leader> <cmd>Telescope buffers<cr>
"   nnoremap <C-p>h <cmd>Telescope oldfiles<cr>
"   nnoremap <C-p>T <cmd>Telescope tags<cr>
"   nnoremap <C-p>t <cmd>Telescope current_buffer_tags<cr>
"   " nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" " }

" " lua <<EOL
" "   require('telescope').setup{
" "     pickers = {
" "       git_files = {
" "         sorter = "fzy_sorter",
" "       }
" "     },
" "   }
" " EOL

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
" call neomake#configure#automake('nw', 750)

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

" lua require('lsp')

lua require('completion')

" lewis6991/gitsigns.nvim
lua require('signs')

" lsp_lines.nvim
lua require("lsp_lines").setup()
lua vim.diagnostic.config({ virtual_text = false })

" DAP/Debugger support
lua require('debugger')

" nvim-base16
lua require('base16-colorscheme').with_config { telescope = false } -- fix ugliness
colorscheme base16-default-dark

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=250}
augroup END
