" Styles
set t_Co=256
set background=dark
colorscheme solarized

" Monokai configs
" let g:materialmonokai_subtle_spell=0
" let g:materialmonokai_custom_lint_indicators=1
" let g:materialmonokai_italic=1
" colorscheme material-monokai

" Force transparency
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! VertSplit ctermbg=NONE guibg=NONE

hi! LineNr ctermbg=NONE guibg=NONE
" Ale
hi! ALEErrorSign ctermbg=NONE guibg=NONE
hi! ALEWarningSign ctermbg=NONE guibg=NONE
" GitGutter
hi! GitGutterAdd ctermbg=NONE guibg=NONE
hi! GitGutterChange ctermbg=NONE guibg=NONE
hi! GitGutterDelete ctermbg=NONE guibg=NONE
hi! GitGutterChangeDelete ctermbg=NONE guibg=NONE
hi! SignColumn ctermbg=NONE guibg=NONE

" Required for monokai, I can't remember why though
" if has("termguicolors")     " set true colors
"     set t_8f=\[[38;2;%lu;%lu;%lum
"     set t_8b=\[[48;2;%lu;%lu;%lum
"     set termguicolors
" endif

let g:indentLine_color_term = 24
let g:indentLine_char = '·'

