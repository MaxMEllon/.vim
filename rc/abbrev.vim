function! s:noreabbrev_wrap(...)
  execute a:1 . 'abbrev ' . a:2 . ' ' . a:3
endfunction
command! -nargs=* Abbr call s:noreabbrev_wrap(<f-args>)

let s:abbrs = [
      \   {'type': 'i', 'before': 'tihs',      'after' : 'this'},
      \   {'type': 'i', 'before': 'edn',       'after' : 'end'},
      \   {'type': 'i', 'before': 'adn',       'after' : 'and'},
      \   {'type': 'i', 'before': 'REact',     'after' : 'React'},
      \   {'type': 'i', 'before': '):',        'after' : ');'},
      \   {'type': 'i', 'before': 'initalize', 'after' : 'initialize'},
      \   {'type': 'c', 'before': 'fzf',       'after' : 'FZF'},
      \   {'type': 'c', 'before': 'cdu',       'after' : 'Cdu'},
      \   {'type': 'c', 'before': 'unite',     'after' : 'Unite'},
      \   {'type': 'c', 'before': 'tig',       'after' : 'Tig'},
      \   {'type': 'c', 'before': 'ggrep',     'after' : 'Ggrep'},
      \   {'type': 'c', 'before': 'hgrep',     'after' : 'Hgrep'},
      \   {'type': 'c', 'before': 'gist',      'after' : 'Gist'},
      \   {'type': 'c', 'before': 'cd',        'after' : 'Cd'},
      \ ]

for s:e in s:abbrs
  call s:noreabbrev_wrap(s:e['type'], s:e['before'], s:e['after'])
endfor
