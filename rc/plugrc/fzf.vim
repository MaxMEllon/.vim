let g:fzf_action = {
      \ 'ctrl-t': 'tab split', 
      \ 'ctrl-x': 'tab split', 
      \ 'ctrl-v': 'tab split' }

let g:fzf_layout = { 'up' : '~40%',  'options': '--reverse' }

nnoremap <Space>b :<C-u>Buffers<CR>
nnoremap <Space>g :<C-u>GFiles<CR>
nnoremap <Space>f :<C-u>Filetypes<CR>
nnoremap <Space>w :<C-u>Windows<CR>

command! LsOpen call maxmellon#fzf#ls_open_file_fzf()
command! Cdp call maxmellon#fzf#select_directory_fzf()

