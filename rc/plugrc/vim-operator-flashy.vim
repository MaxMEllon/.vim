let s:V = vital#maxmellon#of()
let s:Highlight = s:V.import('Coaster.Highlight')
let s:Search = s:V.import('Coaster.Search')

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
let g:operator#flashy#group = 'MyGlashy'
let g:operator#flashy#flash_time = 10000

function! s:clear() abort
  call s:Highlight.clear('FlashyCursor')
  call s:Highlight.clear('YankRegion')
endfunction

augroup Flasshy
  autocmd!
  autocmd CmdwinLeave * call s:clear()
augroup END
