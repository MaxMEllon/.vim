au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
    \ 'name': 'flow',
    \ 'whitelist': ['javascript'],
    \ 'completor': function('asyncomplete#sources#flow#completor'),
    \ 'config': {
    \    'prefer_local': 1,
    \    'flowbin_path': expand('~/.dotfiles/node_modules/.bin/flow'),
    \    'show_typeinfo': 1
    \ }}))
