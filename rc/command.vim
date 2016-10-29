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
function! s:opener(...)
  if executable('google')
    call system("google " . expand(a:1) . ' &>/dev/null 2>&1 &')
  endif
endfunction

function s:google(...)
  if executable('opener')
    call system("opener " . expand(a:1) . ' &>/dev/null 2>&1 &')
  endif
endfunction

command! -nargs=? Google :call s:opener(<f-args>)
command! -nargs=? Opener :call s:google(<f-args>)
