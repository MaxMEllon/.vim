let g:fzf_action = {
      \ 'ctrl-t': 'tab split', 
      \ 'ctrl-x': 'tab split', 
      \ 'ctrl-v': 'tab split' }

let g:fzf_layout = { 'up' : '~40%',  'options': '--reverse' }

nnoremap <Space>a :<C-u>Ag <C-r><C-w><CR>
nnoremap <Space>b :<C-u>Buffers<CR>
nnoremap <Space>c :<C-u>BCommits<CR>
nnoremap <Space>g :<C-u>GFiles<CR>
nnoremap <Space>s :<C-u>GFiles?<CR>
nnoremap <Space>t :<C-u>Filetypes<CR>
nnoremap <Space>w :<C-u>Windows<CR>

function! s:ls_open_file_callback(candidate) abort
  execute 'edit ' . a:candidate
endfunction

function! s:ls_open_file_fzf() abort
  call fzf#run({
        \ 'source':  'ls -1awF',
        \ 'sink': function('s:ls_open_file_callback'),
        \ 'down': 20
        \ })
endfunction

command! LsOpen call s:ls_open_file_fzf()
nnoremap <Space>f :<C-u>LsOpen<CR>

function! s:cd_fzf_callback(candidate) abort
  let s:directory = substitute(a:candidate, ' ', '\ ', 'g')
  execute 'cd ' . s:directory
endfunction

function! s:select_directory_fzf()
  call fzf#run({
        \ 'source': 'find * -type d',
        \ 'sink': function('s:cd_fzf_callback'),
        \ 'down': 20
        \ })
endfunction

command! Cdp call s:select_directory_fzf()
nnoremap <Space>d :<C-u>Cdp<CR>

