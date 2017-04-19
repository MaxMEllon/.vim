let g:completor_auto_trigger = 1
let g:completor_min_chars = 2
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
let g:completor_ruby_omni_trigger = '([\w.]+|[\w.::]+)'
let g:completor_javascript_omni_trigger = '([\w.]+)'

inoremap <expr>   <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr>   <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr>    <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr>   <C-K> pumvisible() ? "\<C-y>" : "\<C-k>"

augroup completor
  autocmd!
  autocmd VimEnter * call completor#enable()
augroup END
