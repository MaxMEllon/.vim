let g:lightline = {
      \   'mode_map': {
      \     'n' : 'N',
      \     'i' : 'I',
      \     'R' : 'R',
      \     'v' : 'V',
      \     'V' : 'V-L',
      \     'c' : 'COMMAND',
      \     "\<C-v>": 'V-B',
      \     's' : 'SELECT',
      \     'S' : 'S-L',
      \     "\<C-s>": 'S-B',
      \   },
      \   'component': {
      \     'readonly': '[RO]',
      \   },
      \   'separator': { 'left': "|", 'right': "|" },
      \   'subseparator': { 'left': ":", 'right': ":" },
      \   'active': {
      \     'left':  [ [ 'mode', 'paste', 'capstatus'  ],
      \                [ 'anzu', 'fugitive', 'neomake' ],
      \                [ 'filename' ] ],
      \     'right': [ [ 'qfstatusline' ],
      \                [ 'filetype' ],
      \                [ 'fileencoding' ],
      \                [ 'fileformat' ] ]
      \   },
      \   'component_expand': {
      \     'syntastic': 'SyntasticStatuslineFlag',
      \     'qfstatusline' : 'qfstatusline#Update'
      \   },
      \   'component_type': {
      \     'syntastic': 'error',
      \     'qfstatusline': 'error',
      \   },
      \   'component_function': {
      \     'anzu' : 'anzu#search_status',
      \     'fugitive' : 'MyFugitive',
      \     'neomake' : 'MyNeomake',
      \     'mode' : 'MyMode'
      \   }
      \ }

let g:Qfstatusline#UpdateCmd = function('lightline#update')

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

function! MyNeomake()
  if !exists('*neomake#statusline#LoclistCounts')
    return ''
  endif

  " Count all the errors, warnings
  let total = 0

  for s:v in values(neomake#statusline#LoclistCounts())
    let total += v
  endfor

  for s:v in items(neomake#statusline#QflistCounts())
    let total += s:v
  endfor

  if total == 0
    return ''
  endif

  unlet v

  return 'Errors : ' . total
endfunction
