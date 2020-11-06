set termwinkey=<C-w>
tnoremap <F3> <C-w>gt
tnoremap <F2> <C-w>gT
tnoremap <Esc> <C-w>N

Autocmd TerminalOpen * if &buftype == 'terminal' | setlocal bufhidden=hide | endif

command! Terminal bo terminal! ++close ++rows=13
