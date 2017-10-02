augroup MyFileType
  autocmd!
augroup END

command! -nargs=* AutocmdFileType autocmd filetypedetect <args>

function! maxmellon#filetype#set(...)
  execute 'AutocmdFileType BufNewFile,BufRead' . ' *.' . a:1 . ' setlocal filetype=' . a:2
endfunction