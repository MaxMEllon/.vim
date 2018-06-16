scriptencoding utf-8

let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \   'p:package',
      \   'i:imports:1',
      \   'c:constants',
      \   'v:variables',
      \   't:types',
      \   'n:interfaces',
      \   'w:fields',
      \   'e:embedded',
      \   'm:methods',
      \   'r:constructor',
      \   'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \   't' : 'ctype',
      \   'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \   'ctype' : 't',
      \   'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" The MIT License (MIT)
"
" Copyright (c) 2018 MURAOKA Taro <koron.kaoriya@gmail.com>
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
function! s:IfErr()
  if !executable('iferr')
    call system('go get -u github.com/koron/iferr')
  endif

  let bpos = wordcount()['cursor_bytes']
  let out = systemlist('iferr -pos ' . bpos, bufnr('%'))
  if len(out) == 1
    return
  endif
  let pos = getcurpos()
  call append(pos[1], out)
  silent normal! j=2j
  call setpos('.', pos)
  silent normal! 4j
endfunction

command! -buffer -nargs=0 IfErr call s:IfErr()
