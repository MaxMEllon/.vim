AutocmdFT javascript nnoremap ,gd :<C-u>YcmCompleter GetDoc<CR>
AutocmdFT javascript nnoremap ,gt :<C-u>YcmCompleter GoTo<CR>
Autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
Autocmd FileType ruby setlocal omnifunc=
Autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
Autocmd BufEnter * set completeopt-=preview
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \}
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-n>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-p>']
let g:ycm_key_list_stop_completion = ['<C-k>']
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
