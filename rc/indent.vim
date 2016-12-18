augroup MyIndent
  autocmd!
augroup END

set expandtab
set shiftwidth  =2
set tabstop     =2
set softtabstop =2
set autoindent
set smartindent
set cindent
set smarttab

command! -nargs=* AutocmdIndentFT autocmd MyIndent FileType <args>

" s:set_tab_width()
" @args {Number} tab_width
" @args {Number} s:true or s:false (1 or 0)
function! s:set_tab_width(width, is_expand)
  let &l:tabstop = a:width
  let &l:shiftwidth = a:width
  let &l:softtabstop = a:width
  if a:is_expand == g:true
    setlocal expandtab
  else
    setlocal noexpandtab
  end
endfunction

" wrapper commands
" :TabIndent
" @commanddoc set tab indent width to current buffer
" @args {Number}  : indent width
command! -bar -nargs=1 TabIndent
      \ call s:set_tab_width(<args>, g:false)

" :SpaceIndent
" @commanddoc set space indent width to current buffer
" @args {Number}  : indent width
command! -bar -nargs=1 SpaceIndent
      \ call s:set_tab_width(<args>, g:true)

function! s:set_indent(...)
  execute 'AutocmdIndentFT ' . a:1 'call s:set_tab_width(' . a:2 . ',' . a:3 . ')'
endfunction
" :IndentFT
" @commanddoc set indent width by filetype
" @args {Number}  : indent width
" @args {Boolean} : expand?
command! -nargs=* IndentFT call s:set_indent(<f-args>)

let s:MyIndentConfigs = [
      \   {'type': 'python',     'width': '4', 'is_space': g:false},
      \   {'type': 'java',       'width': '4', 'is_space': g:true},
      \   {'type': 'php',        'width': '4', 'is_space': g:false},
      \   {'type': 'make',       'width': '4', 'is_space': g:false},
      \   {'type': 'yaml',       'width': '2', 'is_space': g:true},
      \   {'type': 'conf',       'width': '4', 'is_space': g:false},
      \   {'type': 'coffee',     'width': '2', 'is_space': g:true},
      \   {'type': 'slim',       'width': '2', 'is_space': g:true},
      \   {'type': 'fish',       'width': '2', 'is_space': g:true},
      \   {'type': 'toml',       'width': '2', 'is_space': g:true},
      \   {'type': 'plantuml',   'width': '2', 'is_space': g:true},
      \   {'type': 'javascript', 'width': '2', 'is_space': g:true},
      \   {'type': 'ruby',       'width': '2', 'is_space': g:true},
      \   {'type': 'gitconfig',  'width': '2', 'is_space': g:false},
      \   {'type': 'haskell',    'width': '4', 'is_space': g:true},
      \ ]

for s:e in s:MyIndentConfigs
  call s:set_indent(s:e['type'], s:e['width'], s:e['is_space'])
endfor
