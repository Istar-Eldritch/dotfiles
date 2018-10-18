" Styles
set t_Co=256
set background=dark
colorscheme material-monokai
let g:materialmonokai_subtle_spell=0
let g:materialmonokai_custom_lint_indicators=1
let g:materialmonokai_italic=1


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

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif


set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:indentLine_color_term = 24
let g:indentLine_char = '·'

