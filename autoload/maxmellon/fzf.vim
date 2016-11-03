function! s:ls_open_file_callback(candidate) abort
  execute 'edit ' . a:candidate
endfunction

function! maxmellon#fzf#ls_open_file_fzf() abort
  call fzf#run({
        \ 'source':  'ls -1awF',
        \ 'sink': function('s:ls_open_file_callback'),
        \ })
endfunction

function! s:cd_fzf_callback(candidate) abort
  let s:directory = substitute(a:candidate, ' ', '\ ', 'g')
  execute 'cd ' . s:directory
endfunction

function! maxmellon#fzf#select_directory_fzf()
  call fzf#run({
        \ 'source': 'find * -type d',
        \ 'sink': function('s:cd_fzf_callback'),
        \ })
endfunction

