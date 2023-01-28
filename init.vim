
call plug#begin('~/.vim/plugged')

" Statistics
Plug 'wakatime/vim-wakatime' " https://wakatime.com/vim
Plug 'vimsence/vimsence' "Integration with discord

" Navigation
Plug 'MattesGroeger/vim-bookmarks' " Extended bookmarks
Plug 'scrooloose/nerdtree' " File explorer
Plug 'christoomey/vim-tmux-navigator' " Integration with TMUX

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim' "Allows opening buffers in github

" Cosmetic
Plug 'Yggdroot/indentLine' " Show indentation characters

Plug 'nvim-treesitter/nvim-treesitter'

" General coding tools
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

Plug 'diepm/vim-rest-console' " REST calls tool
Plug 'elzr/vim-json'  " JSON syntax and goodies
Plug 'airblade/vim-gitgutter' " Shows +/- on the editor based on g diff HEAD^
Plug 'Xuyuanp/nerdtree-git-plugin' " Show git status in nerd-tree
Plug 'tpope/vim-fugitive' " Overpowered git extensions and commands
Plug 'tpope/vim-rhubarb' " Open browser pointing to code in Github project
Plug 'dbgx/lldb.nvim' " lldb debugger integration

Plug 'tpope/vim-eunuch' " General unix tools from vim

Plug 'plasticboy/vim-markdown' " Markdown


call plug#end()

filetype plugin indent on
set backupcopy=yes
set nofixendofline
set nocompatible
set encoding=utf-8
syntax on
set number
set ruler
" No key scape time (https://www.johnhawthorn.com/2012/09/vi-escape-delays/)
set timeoutlen=1000 ttimeoutlen=0
"show existing tab with 2 spaces width
set tabstop=2
 " when indenting with '>', use 2 spaces width
set shiftwidth=2
 " On pressing tab, insert 2 spaces
set expandtab

let g:vim_markdown_folding_disabled = 1

" Enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1

" customise deoplete maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

" Ctrl-Space for autocompletion and Ctrl-j and Ctrl-k for selection
imap <c-space> <c-x><c-o>
imap <c-j> <Down>
imap <c-k> <Up>

" Rest console configuration
" Bindings under ,rq
source ~/.vim/custom_cfg/rest-console.vim

" Rust specific configs
source ~/.vim/custom_cfg/rust.vim

" JSON tools
source ~/.vim/custom_cfg/json.vim

" Navigation configs
source ~/.vim/custom_cfg/navigation.vim

" Writing configs
source ~/.vim/custom_cfg/writing.vim

" Cosmetic
source ~/.vim/custom_cfg/cosmetic.vim

" Typescript
" Use LSP omni-completion in typescript files
autocmd Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc

let cwd = getcwd()

set shell=sh

" Save and load sessions
nnoremap <F2> :mks! <CR>
nnoremap <F3> :source Session.vim <CR>

" Unselect text after search
nnoremap <Esc> :noh <CR>

" Reload config
nnoremap <c-c> :so $MYVIMRC <CR>

set foldmethod=manual
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

