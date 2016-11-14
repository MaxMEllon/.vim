command! -nargs=? ToggleOpt call maxmellon#toggle#option(g:false, <q-args>)
command! -nargs=? ToggleOptGlobal call maxmellon#toggle#option(g:true, <q-args>)

command! Date  :call setline('.', getline('.') . strftime('○ %Y.%m.%d (%a) %H:%M'))

command! JSONFormat %!python -m json.tool

if executable('shiba')
  command! Shiba  :! shiba % &>/dev/null 2>&1 &
endif

command! SyntaxInfo call maxmellon#syntax_info()
command! RTP call maxmellon#runtimepath#show()

command! -nargs=? Google call maxmellon#opener(<f-args>)
command! -nargs=? Opener call maxmellon#google(<f-args>)

command! -nargs=? Cdu call maxmellon#cdgitroot#exec()
command! -nargs=? Cd call maxmellon#cd#exec(<f-args>)

command! -nargs=? Ggrep  call maxmellon#grep#gitgrep(<f-args>)
command! -nargs=? Hgrep  call maxmellon#grep#hw(<f-args>)
command! -nargs=? Jvgrep call maxmellon#grep#jvgrep(<f-args>)
