augroup myfiletypedetect
  autocmd!
augroup END

command! -nargs=* AutocmdFileType autocmd myfiletypedetect <args>

function! maxmellon#filetype#set(...)
  execute 'AutocmdFileType BufNewFile,BufRead,BufReadPost' . ' *.' . a:1 . ' setfiletype ' . a:2
endfunction
