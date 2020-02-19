let g:lightline = {
      \   'colorscheme': 'one',
      \   'mode_map': {
      \     'n' : 'Normal',
      \     'i' : 'Insert',
      \     'R' : 'Replace',
      \     'v' : 'Virtual',
      \     'V' : 'V-Line',
      \     'c' : 'COMMAND',
      \     "\<C-v>": 'V-Block',
      \     's' : 'SELECT',
      \     'S' : 'S-Line',
      \     "\<C-s>": 'S-Block',
      \   },
      \   'tabline': {'left': [['buffers']], 'right': [['close']]},
      \   'component': {
      \     'readonly': '[RO]',
      \   },
      \   'separator': { 'left': "", 'right': "" },
      \   'subseparator': { 'left': "", 'right': "" },
      \   'active': {
      \     'left':  [ [ 'mode', 'paste', 'capstatus'  ],
      \                [ 'filename' ] ],
      \     'right': [ [ 'qfstatusline' ],
      \                [ 'filetype' ],
      \                [ 'fileencoding' ],
      \                [ 'fileformat' ] ]
      \   },
      \   'component_expand': {
      \     'syntastic': 'SyntasticStatuslineFlag',
      \     'qfstatusline' : 'qfstatusline#Update',
      \     'buffers': 'lightline#bufferline#buffers'
      \   },
      \   'component_type': {
      \     'syntastic': 'error',
      \     'qfstatusline': 'error',
      \     'buffers': 'tabsel'
      \   },
      \   'component_function': {
      \     'fugitive' : 'MyFugitive',
      \     'mode' : 'MyMode'
      \   }
      \ }

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:Qfstatusline#UpdateCmd = function('lightline#update')

Autocmd BufEnter * hi LightlineMiddle_active term=None guifg=#333333 guibg=#034373 ctermfg=234 ctermbg=21
Autocmd BufEnter * hi LightlineMiddle_inactive term=None guifg=#333333 guibg=#737373 ctermfg=234 ctermbg=247
Autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" gitbranch名
function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && strlen(fugitive#head())
      let s:_ = fugitive#head()
      return strlen(s:_) ? s:_ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return  fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ &ft == 'undotree' ? 'UndoTree' :
        \ &ft == 'dirvish' ? 'Dirvish' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

set noshowmode
