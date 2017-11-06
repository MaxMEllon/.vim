map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

let g:operator#flashy#group = 'MelonGlashy'
let g:operator#flashy#flash_time = 500

augroup Flashy
  autocmd!
  autocmd VimEnter * highlight MelonGlashy ctermbg=22
augroup END
