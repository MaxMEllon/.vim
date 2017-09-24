let g:neomake_message_sign = {'text': '>', 'texthl': 'NeomakeMessageSign'}
let g:neomake_warning_sign = {'text': '!', 'texthl': 'Identifier'}
let g:neomake_error_sign   = {'text': 'X', 'texthl': 'Statement'}
let g:neomake_info_sign    = {'text': 'i', 'texthl': 'NeomakeInfoSign'}

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

let g:neomake_javascript_eslint_marker = {
      \   'exe': 'eslint_d',
      \   'args': ['-f', 'compact', '--fix'],
      \   'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
      \   '%W%f: line %l\, col %c\, Warning - %m'
      \ }

let g:neomake_cpp_enable_markers = ['clang']
let g:neomake_cpp_clang_args = ['-std=c++14', '-Wextra', '-Wall', '-fsanitize=undefined', '-g']

nnoremap <F4> :<C-u>lprev<CR>
nnoremap <F5> :<C-u>lnext<CR>
nnoremap ,l :<C-u>Unite location_list<CR>

Autocmd BufWrite,BufEnter * :Neomake
