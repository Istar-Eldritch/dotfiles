function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999

endfunction

function! s:goyo_leave()
  silent !tmux set status on

  set showmode
  set showcmd
  set scrolloff=5


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

endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
