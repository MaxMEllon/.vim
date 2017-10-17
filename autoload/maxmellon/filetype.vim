augroup myfiletypedetect
  autocmd!
augroup END

command! -nargs=* AutocmdFileType autocmd myfiletypedetect <args>

function! maxmellon#filetype#set(...)
  execute 'AutocmdFileType BufNewFile,BufRead' . ' *.' . a:1 . ' setlocal filetype=' . a:2
endfunction
