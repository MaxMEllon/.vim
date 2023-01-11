let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <C-]> :LspDefinition<CR>
