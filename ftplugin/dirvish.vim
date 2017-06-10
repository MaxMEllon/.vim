" See: ../autoload/maxmellon/dirvish.vim
" See: https://github.com/MaxMEllon/.vim/blob/master/ftplugin/dirvish.vim

command! -nargs=* Mv call maxmellon#dirvish#mv(<f-args>)
command! -nargs=* Rm call maxmellon#dirvish#rm(<f-args>)
command! -nargs=* Rmdir call maxmellon#dirvish#rmdir(<f-args>)
command! -nargs=* Cp call maxmellon#dirvish#cp(<f-args>)
command! Cdu call maxmellon#dirvish#cdgitroot()

nnoremap <buffer> mv :Mv <C-r><C-a> <C-r><C-a>
nnoremap <buffer> rm :Rm <C-r><C-a>
nnoremap <buffer> to :Touch<Space>
nnoremap <buffer> mk :Mkdir<Space>
nnoremap <buffer> cp :Cp <C-r><C-a> <C-r><C-a>
nnoremap <buffer> cdu :Cdu<CR>

try
  lcd %:h
catch
endtry

let g:branch = ''
