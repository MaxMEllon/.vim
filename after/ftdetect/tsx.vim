augroup Tsx
  autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
  autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
augroup END
