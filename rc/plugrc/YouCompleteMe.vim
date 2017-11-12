AutocmdFT javascript nnoremap ,gd :<C-u>YcmCompleter GetDoc<CR>
Autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
Autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
Autocmd BufEnter * set completeopt-=preview

Autocmd FileType javascript,c,cpp nnoremap <C-]> :<C-u>YcmCompleter GoTo<CR>

let g:ycm_global_ycm_extra_conf = expand('~/.vim/') . '.ycm_extra_conf.py'

let g:ycm_auto_trigger = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

let g:ycm_filetype_blacklist = {
      \ 'tagbar':   1,
      \ 'qf':       1,
      \ 'notes':    1,
      \ 'markdown': 1,
      \ 'unite':    1,
      \ 'text':     1,
      \ 'vimwiki':  1,
      \ 'pandoc':   1,
      \ 'infolog':  1,
      \ 'mail':     1,
      \}

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-n>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-p>']
let g:ycm_key_list_stop_completion = ['<C-k>']
let g:ycm_semantic_triggers =  {
      \ 'c':          ['->', '.'],
      \ 'objc':       ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
      \           're!\[.*\]\s'],
      \ 'ocaml':      ['.', '#'],
      \ 'cpp,objcpp': ['->', '.', '::'],
      \ 'perl':       ['->'],
      \ 'php':        ['->', '::'],
      \ 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
      \ 'ruby':       ['.', '::'],
      \ 'lua':        ['.', ':'],
      \ 'erlang':     [':'],
      \}
