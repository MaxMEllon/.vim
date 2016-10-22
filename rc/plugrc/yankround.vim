nmap p <Plug>(yankround-p)
xmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
if g:plug.is_loaded('unite.vim')
  nnoremap ,y :Unite yankround<CR>
endif

