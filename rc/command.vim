command! -nargs=? ToggleOpt call maxmellon#toggle#option(g:false, <q-args>)
command! -nargs=? ToggleOptGlobal call maxmellon#toggle#option(g:true, <q-args>)

command! Date :call setline('.', getline('.') . strftime('○ %Y.%m.%d (%a) %H:%M'))

command! JSONFormat %!jq '.'

if executable('shiba')
  command! Shiba :silent call system('shiba ' . expand('%') . ' &>/dev/null 2>&1 &') | redraw!
endif

command! SyntaxInfo call maxmellon#syntax_info()
command! RTP call maxmellon#runtimepath#show()

command! -nargs=? Google call maxmellon#opener(<f-args>)
command! -nargs=? Opener call maxmellon#google(<f-args>)

command! -nargs=? Cdu    call maxmellon#cdgitroot#exec()
command! -nargs=? Cd     call maxmellon#cd#exec(<f-args>)

command! -nargs=? Ggrep  call maxmellon#grep#gitgrep(<f-args>)
command! -nargs=? Hgrep  call maxmellon#grep#hw(<f-args>)
command! -nargs=? Jvgrep call maxmellon#grep#jvgrep(<f-args>)
command! -nargs=? Grep   call maxmellon#grep#grep(<f-args>)
command! -nargs=? G      call maxmellon#grep#grep(<f-args>)

command! Ls         call maxmellon#ls#show()
command! LsOpen     call maxmellon#fzy#lsopen()
command! GHQ        call maxmellon#fzy#ghq_list()
command! GitLsFiles call maxmellon#fzy#git_ls_files()
command! Gdiff      call maxmellon#git#diff#open()

augroup MyVimrc
 autocmd!
augroup END

" autocmd wrapper
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>
