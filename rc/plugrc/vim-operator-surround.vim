map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)a
map <silent>sr <Plug>(operator-surround-replace)a

for s:i in split('<>[](){}''"', '\zs')
  execute 'nmap <silent> ,' . s:i . ' saiw' . s:i
endfor

for s:i in split('~*', '\zs')
  execute 'nmap <silent> ,' . s:i . ' saiw' . s:i . 'w.'
endfor
