autocmd FileType rust nmap <leader>df <Plug>(rust-def)
autocmd FileType rust nmap <leader>dc <Plug>(rust-doc)

" Rust & Racer
let g:racer_cmd = "/home/istar/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rust_recommended_style = 1
let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustup run nightly rustfmt"
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_linters = {'rust': ['rls', 'cargo']}
let g:ale_rust_rls_executable = "/home/istar/.cargo/bin/rls"

