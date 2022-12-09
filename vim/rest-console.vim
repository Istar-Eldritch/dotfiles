
" VIM-REST-CONSOLE (#2975)
" Allow GET requests to have body
"   note: vrc_split_request_body is ignored (= 0) when this is set (= 1)
let g:vrc_allow_get_request_body = 1
" Enable automatic formatting of the response
let g:vrc_auto_format_response_enabled = 1
" Include response header
" let g:vrc_include_response_header = 1
" Print executed curl command
let g:vrc_show_command = 0
" Set trigger key (<C-j> by default)
let g:vrc_trigger = '<leader>rq'

let g:vrc_curl_opts = {
  \ '--connect-timeout' : 5,
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 5,
  \ '--ipv4': '',
  \ '-k': '',
  \ '-s': '',
  \ '-S': '',
\}
