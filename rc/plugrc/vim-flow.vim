let g:flow#showquickfix = 0
let g:flow#omnifunc = 1
let g:flow#enable = 0
let g:flow_loc = expand('~/.vim/node_modules/.bin')
if isdirectory(g:flow_loc)
  let g:flow#flowpath = '~/.vim/node_modules/.bin/flow'
else
  if executable('yarn')
   call system('cd ~/.vim && yarn')
   echomsg 'Flow installed !!'
  endif
endif

