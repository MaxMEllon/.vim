function! s:toggle_option(global, opt)
  if exists('&' . a:opt)
    let s:set = a:global == g:true ? 'set' : 'setlocal'
    execute s:set . ' ' . a:opt . '! ' . a:opt . '?'
  else
    echo 'unkown option' . a:opt
  endif
endfunction

command! -nargs=? ToggleOpt call s:toggle_option(g:false, <q-args>)
command! -nargs=? ToggleOptGlobal call s:toggle_option(g:true, <q-args>)

command! Date  :call setline('.', getline('.') . strftime('○ %Y.%m.%d (%a) %H:%M'))

command! JSONFormat %!python -m json.tool

if executable('shiba')
  command! Shiba  :! shiba % &>/dev/null 2>&1 &
endif

" See: https://github.com/MaxMEllon/.dotfiles/blob/master/bin/google
if executable('google')
  command! -nargs=? Google :call system("google " . expand(<f-args>) . ' &>/dev/null 2>&1 &')
  nnoremap ,g :Google <C-r><C-a><CR>
endif

if executable('opener')
  command! -nargs=? Opener :call system("opener " . expand(<f-args>) . ' &>/dev/null 2>&1 &')
  nnoremap ,o :Opener <C-r><C-a><CR>
endif
