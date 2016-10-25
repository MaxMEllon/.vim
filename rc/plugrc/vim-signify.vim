nmap <Leader>gj <Plug>(signify-next-hunk)zz
nmap <Leader>gk <Plug>(signify-prev-hunk)zz
nmap <Leader>gh <Plug>(signify-toggle-highlight)
nmap <Leader>gt <Plug>(signify-toggle)

Autocmd VimEnter * highlight SignifySignAdd    cterm=bold ctermbg=0 ctermfg=119
Autocmd VimEnter * highlight SignifySignDelete cterm=bold ctermbg=0 ctermfg=167
Autocmd VimEnter * highlight SignifySignChange cterm=bold ctermbg=0 ctermfg=227

call AddToggleCommand('SignifyToggle')
