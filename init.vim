
call plug#begin('~/.vim/plugged')

" Statistics
Plug 'wakatime/vim-wakatime' " https://wakatime.com/vim

" Navigation
Plug 'MattesGroeger/vim-bookmarks' " Extended bookmarks
Plug 'scrooloose/nerdtree' " File explorer
Plug 'christoomey/vim-tmux-navigator' " Integration with TMUX

" Cosmetic
Plug 'vim-airline/vim-airline' " Status line styles
Plug 'Yggdroot/indentLine' " Show indentation characters
Plug 'ryanoasis/vim-devicons' " Nice icons for files and others
Plug 'skielbasa/vim-material-monokai' " monokai color scheme

" Typescript tools
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" Rust tools
Plug 'rust-lang/rust.vim'  " The oficial rust vim plugin
Plug 'racer-rust/vim-racer' " Autocomplete rust using racer
Plug 'rhysd/rust-doc.vim'  " Shows rust docs

" General coding tools
Plug 'w0rp/ale' " Linter
Plug 'Shougo/vimproc.vim', {'do': 'make'} " Required by w0rp
Plug 'majutsushi/tagbar' " eTags navigator
Plug 'diepm/vim-rest-console' " REST calls tool
Plug 'elzr/vim-json'  " JSON syntax and goodies
Plug 'airblade/vim-gitgutter' " Shows +/- on the editor based on g diff HEAD^
Plug 'Xuyuanp/nerdtree-git-plugin' " Show git status in nerd-tree
Plug 'tpope/vim-fugitive' " Overpowered git extensions and commands
Plug 'tpope/vim-rhubarb' " Open browser pointing to code in Github project
Plug 'dbgx/lldb.nvim' " lldb debugger integration

Plug 'tpope/vim-eunuch' " General unix tools from vim

" Writing and presentation Plugins (http://www.naperwrimo.org/wiki/index.php?title=Vim_for_Writers)
Plug 'Alok/notational-fzf-vim' " Take notes and search across them
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Required by notational
Plug 'reedes/vim-pencil'       " Super powered writing things
Plug 'junegunn/limelight.vim'  " Highlights only active paragraph
Plug 'reedes/vim-lexical'      " Lexicographical errors
Plug 'reedes/vim-litecorrect'  " Better autocorrections
Plug 'junegunn/goyo.vim'       " Spacing
Plug 'godlygeek/tabular'       " Crate tables
Plug 'plasticboy/vim-markdown' " Markdown
Plug 'sotte/presenting.vim'    " Presentations

call plug#end()

filetype plugin indent on
set backupcopy=yes
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

" Notational configuration
" Bindings under ,nt
source ~/dotfiles/vim/notational.vim

" Rest console configuration
" Bindings under ,rq
source ~/dotfiles/vim/rest-console.vim

" Typescript specific configs
source ~/dotfiles/vim/typescript.vim

" Rust specific configs
source ~/dotfiles/vim/rust.vim

" JSON tools
source ~/dotfiles/vim/json.vim

" Buffer ergos
source ~/dotfiles/vim/airline.vim

" Navigation configs
source ~/dotfiles/vim/navigation.vim

" Writing configs
source ~/dotfiles/vim/writing.vim

" Cosmetic
source ~/dotfiles/vim/cosmetic.vim

" Cosmetic
source ~/dotfiles/vim/presentation.vim


"if (empty($TMUX))
"    if (has("nvim"))
"        "For Neovim 0.1.3 and 0.1.4
"        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"    endif
"
"    "For Neovim 0.1.5+ and Vim 7.4.1799+
"    if (has("termguicolors"))
"        set termguicolors
"    endif
"endif

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

" Ctrl-Space for autocompletion
imap <c-space> <c-x><c-o>
" Show the eTag navigator
nmap <F8> :TagbarToggle<CR>
