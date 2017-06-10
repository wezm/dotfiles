if has("gui_macvim")
  set guifont=PragmataProMono:h12,Consolas:h11,Menlo:h12,ProggyTiny:h8,Luxi_Mono:h12:cANSI

  nmap <D-1> 1gt
  nmap <D-2> 2gt
  nmap <D-3> 3gt
  nmap <D-4> 4gt
  nmap <D-5> 5gt
  nmap <D-6> 6gt
  nmap <D-7> 7gt
  nmap <D-8> 8gt
  nmap <D-9> 9gt

  " Strip trailing whitespace
  nmap <C-M-D-s> :%s/[[:space:]]\+$//<CR>

  " cmd-/ to toggle comments
  nmap <D-/> <Leader>c 
  vmap <D-/> <Leader>c 
  nmap <D-E> :NERDTreeToggle<CR>

  " Ack with cmd-shift-f
  nmap <D-F> :Ack 

  " ctrl-k to edit above
  imap <C-k> <Esc>O
endif

if has("gui_gtk2")
  set guifont=PragmataProMono:h12,Consolas:h11,Monospace\ 9,Liberation\ Mono\ 9,Bitstream\ Vera\ Sans\ Mono\ 12,Fixed\ 12
  "set guifontwide=Microsoft\ Yahei\ 12,WenQuanYi\ Zen\ Hei\ 12
endif
