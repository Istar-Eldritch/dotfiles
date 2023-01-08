" Styles
set t_Co=16
set background=dark
" Next line makes dots look alright with solarized
"let g:indentLine_color_term = 24
let g:indentLine_char = '·'

colorscheme farout

" Monokai configs
" let g:materialmonokai_subtle_spell=0
" let g:materialmonokai_custom_lint_indicators=1
" let g:materialmonokai_italic=1
" colorscheme material-monokai

" Force transparency
hi! Normal ctermbg=None
hi! NonText ctermbg=None
hi! Comment ctermbg=None
hi! Constant ctermbg=None
hi! Error ctermbg=None
hi! Identifier ctermbg=None
hi! Ignore ctermbg=None
hi! PreProc ctermbg=None
hi! Special ctermbg=None
hi! Statement ctermbg=None
hi! String ctermbg=None
hi! Number ctermbg=None
hi! Todo ctermbg=None
hi! Type ctermbg=None
hi! Underlined ctermbg=None
hi! StatusLine ctermbg=None
hi! StatusLineNC ctermbg=None
hi! VertSplit ctermbg=None
hi! TabLine ctermbg=None
hi! TabLineFill ctermbg=None
hi! TabLineSel ctermbg=None
hi! Title ctermbg=None
hi! CursorLine ctermbg=None
hi! LineNr ctermbg=None
hi! CursorLineNr ctermbg=None
hi! qfLineNr ctermbg=None
hi! helpLeadBlank ctermbg=None
hi! helpNormal ctermbg=None
" hi! Visual ctermbg=None
" hi! VisualNOS ctermbg=None
hi! Pmenu ctermbg=None
hi! PmenuSbar ctermbg=None
hi! PmenuSel ctermbg=None
hi! PmenuThumb ctermbg=None
hi! FoldColumn ctermbg=None
hi! Folded ctermbg=None
hi! WildMenu ctermbg=None
hi! SpecialKey ctermbg=None
hi! DiffAdd ctermbg=None
hi! DiffChange ctermbg=None
hi! DiffDelete ctermbg=None
hi! DiffText ctermbg=None
" hi! IncSearch ctermbg=None
" hi! Search ctermbg=None
hi! Directory ctermbg=None
" hi! MatchParen ctermbg=None
hi! SpellBad ctermbg=None
hi! SpellCap ctermbg=None
hi! SpellLocal ctermbg=None
hi! SpellRare ctermbg=None
hi! ColorColumn ctermbg=None
hi! signColumn ctermbg=None
hi! ErrorMsg ctermbg=None
hi! ModeMsg ctermbg=None
hi! MoreMsg ctermbg=None
hi! Question ctermbg=None
hi! WarningMsg ctermbg=None
hi! Cursor ctermbg=None
hi! CursorColumn ctermbg=None
hi! Function ctermbg=None
hi! Operator ctermbg=None
hi! Delimiter ctermbg=None
hi! Boolean ctermbg=None

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


