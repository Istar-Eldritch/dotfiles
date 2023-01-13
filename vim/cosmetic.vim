" Styles
set t_Co=16
set background=dark
" Next line makes dots look alright with solarized
"let g:indentLine_color_term = 24
let g:indentLine_char = '·'

" Monokai configs
" let g:materialmonokai_subtle_spell=0
" let g:materialmonokai_custom_lint_indicators=1
" let g:materialmonokai_italic=1
" colorscheme material-monokai

" Force transparency
hi! Normal ctermbg=None ctermfg=6
hi! NonText ctermbg=None ctermfg=3
hi! Comment ctermbg=None ctermfg=3
hi! Constant ctermbg=None ctermfg=2
hi! Error ctermbg=None ctermfg=5
hi! Identifier ctermbg=None ctermfg=2
hi! Ignore ctermbg=None ctermfg=3
hi! PreProc ctermbg=None ctermfg=4
hi! Special ctermbg=None ctermfg=2
" branches and what not
hi! statement ctermbg=None ctermfg=1 
hi! String ctermbg=None ctermfg=1
hi! Number ctermbg=None ctermfg=1
hi! Todo ctermbg=None ctermfg=1
hi! Type ctermbg=None ctermfg=1
hi! Underlined ctermbg=None ctermfg=4
hi! StatusLine ctermbg=None ctermfg=4
hi! StatusLineNC ctermbg=None ctermfg=3
hi! VertSplit ctermbg=None ctermfg=0
hi! TabLine ctermbg=None ctermfg=0
hi! TabLineFill ctermbg=None ctermfg=0
hi! TabLineSel ctermbg=None ctermfg=0
hi! Title ctermbg=None ctermfg=6
hi! CursorLine ctermbg=None ctermfg=1
hi! LineNr ctermbg=None ctermfg=3
hi! CursorLineNr ctermbg=None ctermfg=4
hi! qfLineNr ctermbg=None ctermfg=4
hi! helpLeadBlank ctermbg=None ctermfg=3
hi! helpNormal ctermbg=None ctermfg=3
hi! Visual ctermbg=5 ctermfg=6
hi! VisualNOS ctermbg=5 ctermfg=6
hi! Pmenu ctermbg=None
hi! PmenuSbar ctermbg=None
hi! PmenuSel ctermbg=None
hi! PmenuThumb ctermbg=None
hi! FoldColumn ctermbg=None ctermfg=3
hi! Folded ctermbg=None ctermfg=3
hi! WildMenu ctermbg=None
hi! SpecialKey ctermbg=None
hi! DiffAdd ctermbg=None ctermfg=2
hi! DiffChange ctermbg=None ctermfg=4
hi! DiffDelete ctermbg=None ctermfg=5
hi! DiffText ctermbg=None ctermfg=3
hi! IncSearch  ctermbg=5 ctermfg=6
hi! Search ctermbg=5 ctermfg=6
hi! Directory ctermbg=None ctermfg=4
hi! MatchParen ctermbg=5 ctermfg=2
hi! SpellBad ctermbg=None
hi! SpellCap ctermbg=None
hi! SpellLocal ctermbg=None
hi! SpellRare ctermbg=None
hi! ColorColumn ctermbg=None
hi! signColumn ctermbg=None
hi! ErrorMsg ctermbg=None ctermfg=5
hi! ModeMsg ctermbg=None ctermfg=4
hi! MoreMsg ctermbg=None ctermfg=4
hi! Question ctermbg=None ctermfg=2
hi! WarningMsg ctermbg=None ctermfg=1
hi! Cursor ctermbg=None
hi! CursorColumn ctermbg=None
hi! Function ctermbg=None ctermfg=4
hi! Operator ctermbg=None ctermfg=4
hi! Delimiter ctermbg=None ctermfg=3
hi! Boolean ctermbg=None ctermfg=1
hi! Character ctermfg=1

hi! DiagnosticError ctermbg=None ctermfg=5
hi! DiagnosticWarn ctermbg=None ctermfg=1
hi! DiagnosticHint ctermbg=None ctermfg=2
hi! DiagnosticInfo ctermbg=None ctermfg=6

" Ale
hi! ALEErrorSign ctermbg=NONE ctermfg=5
hi! ALEWarningSign ctermbg=NONE ctermfg=1
" GitGutter
hi! GitGutterAdd ctermbg=NONE ctermfg=2
hi! GitGutterChange ctermbg=NONE ctermfg=1
hi! GitGutterDelete ctermbg=NONE ctermfg=5
hi! GitGutterChangeDelete ctermbg=NONE ctermfg=5
hi! SignColumn ctermbg=NONE

" Required for monokai, I can't remember why though
" if has("termguicolors")     " set true colors
"     set t_8f=\[[38;2;%lu;%lu;%lum
"     set t_8b=\[[48;2;%lu;%lu;%lum
"     set termguicolors
" endif


