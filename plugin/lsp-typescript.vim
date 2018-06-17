if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server', '--stdio']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
    \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
    \ })
else
  echohl ErrorMsg
  echom 'Sorry, `typescript-language-server` is not installed. See :h vim-lsp-typescript for more details on setup.'
  echohl NONE
endif
