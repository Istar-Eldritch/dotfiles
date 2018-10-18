:nnoremap <leader>nv :NV<CR>

" String[]. Search paths
let g:nv_search_paths = ['~/personal/log/notes', '._playground', 'src', 'README.md']

" String. Set to '' (the empty string) if you don't want an extension appended by default.
" Don't forget the dot, unless you don't want one.
let g:nv_default_extension = '.md'

" String. Default is first directory found in `g:nv_search_paths`. Error thrown
"if no directory found and g:nv_main_directory is not specified
"let g:nv_main_directory = g:nv_main_directory or (first directory in g:nv_search_paths)

" String. Must be in the form 'ctrl-KEY' or 'alt-KEY'
let g:nv_create_note_key = 'ctrl-n'

" String. Controls how new note window is created.
let g:nv_create_note_window = 'vertical split'
