augroup MyFileType
  autocmd!
augroup END

command! -nargs=* AutocmdFileType autocmd MyFileType <args>

function! s:set_filetype(...)
  execute 'AutocmdFileType BufNewFile,BufRead' . ' *' . a:1 . ' setlocal filetype=' . a:2
endfunction

command! -nargs=* SetFileType call s:set_filetype(<f-args>)

let s:MyFileTypes = [
      \   {'file' : '.babelrc',  'type' : 'json'},
      \   {'file' : '.cjsx',     'type' : 'coffee'},
      \   {'file' : '.coffee',   'type' : 'coffee'},
      \   {'file' : '.es6',      'type' : 'javascript'},
      \   {'file' : '.eslintrc', 'type' : 'yaml'},
      \   {'file' : '.ex',       'type' : 'elixir'},
      \   {'file' : '.exs',      'type' : 'elixir'},
      \   {'file' : '.fish',     'type' : 'fish'},
      \   {'file' : '.jsx',      'type' : 'javascript'},
      \   {'file' : '.less',     'type' : 'less'},
      \   {'file' : '.nvim',     'type' : 'vim'},
      \   {'file' : '.sass',     'type' : 'sass'},
      \   {'file' : '.scss',     'type' : 'scss'},
      \   {'file' : '.slim',     'type' : 'slim'},
      \   {'file' : '.toml',     'type' : 'toml'},
      \   {'file' : '.zsh',      'type' : 'zsh'},
      \ ]

for s:e in s:MyFileTypes
  call s:set_filetype(s:e['file'], s:e['type'])
endfor
