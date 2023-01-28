nnoremap <c-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

nnoremap <leader><leader> :e #<CR>
nnoremap <leader>] :BookmarkNext<CR>zt
nnoremap <leader>[ :BookmarkPrev<CR>zt

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
