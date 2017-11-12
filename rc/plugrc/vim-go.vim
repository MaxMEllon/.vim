let g:go_fmt_fail_silently = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_list_type = 'locationlist'

augroup vim-go-map
  autocmd!
  autocmd FileType go nmap <Leader>gi <Plug>(go-import)
  autocmd FileType go nmap <Leader>gb <Plug>(go-build)
augroup END
