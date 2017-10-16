command! -nargs=? ToggleOpt call maxmellon#toggle#option(g:false, <q-args>)
command! -nargs=? ToggleOptGlobal call maxmellon#toggle#option(g:true, <q-args>)

command! Date :call setline('.', getline('.') . strftime('○ %Y.%m.%d (%a) %H:%M'))

command! JSONFormat %!jq '.'

if executable('shiba')
  command! Shiba :silent call async#job#start(['shiba', expand('%')], {})
endif

command! RTP call maxmellon#runtimepath#show()
command! Path call maxmellon#path#show()
command! SyntaxInfo call maxmellon#syntax_info()

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
command! Mru        call maxmellon#fzy#mru()
command! GHQ        call maxmellon#fzy#ghq_list()
command! Gdiff      call maxmellon#git#diff#open()
command! LsOpen     call maxmellon#fzy#lsopen()
command! BufferList call maxmellon#fzy#buffer()
command! GitLsFiles call maxmellon#fzy#git_ls_files()

command! -bar Invert :let &background = (&background == 'light' ? 'dark' : 'light')

augroup MyVimrc
 autocmd!
augroup END

" autocmd wrapper
command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>

command! -bar -nargs=1 TabIndent
      \ call maxmellon#indent#set_tab_width(<args>, g:false)

command! -bar -nargs=1 SpaceIndent
      \ call maxmellon#indent#set_tab_width(<args>, g:true)

command! -nargs=* Abbr call maxmellon#abbrev#func(<f-args>)
command! -nargs=* BindFT call maxmellon#filetype#set(<f-args>)
command! -nargs=+ -bar Indent call maxmellon#indent#set(<args>)
command! -nargs=1 ColorScheme call maxmellon#colorscheme#set(<args>)
