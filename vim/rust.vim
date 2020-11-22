
" setup rust_analyzer LSP (IDE features)
lua require'lspconfig'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" rustfmt on write using autoformat
" autocmd BufWrite *.rs :Autoformat

"TODO: clippy on write
" autocmd BufWrite *.rs :Autoformat

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

