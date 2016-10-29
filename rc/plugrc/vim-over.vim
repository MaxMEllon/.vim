" FIXME: %s/hoge/poge/gc
" before: hoge
" after : poge^]

" nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//gc<C-b><C-b><C-b>
" xnoremap s :<C-u>OverCommandLine<CR>'<,'>s///gc<C-b><C-b><C-b><C-b><C-b>
