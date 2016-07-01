""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" global settings
set nocompatible
set cursorline
set cursorcolumn
set ruler
set nomore
set noeb
set nowrap
set nobackup
set cindent
set showcmd
set hlsearch
set autoread
set autoindent
set linebreak
set smartindent
set smarttab
set expandtab
set tabstop=8
set shiftwidth=4
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,],h,l,~
set pastetoggle=<F9>
set clipboard=unnamed
set mouse=a

syntax on
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" auto commands
if has('autocmd')
    au BufWritePre /tmp/pentadactyl.txt write! /tmp/pentadactyl-lastedit
endif
""" goto the last place when openning a file
if has("autocmd")
   au BufReadPost * if line("'\"") | exe "normal! g'\"" | endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" set the runtime path to include Vundle and initialize
""" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugin mananger
Bundle 'gmarik/vundle'

""" edit assistant plugins
Bundle 'https://github.com/vim-scripts/AutoClose.git'
Bundle 'https://github.com/vim-scripts/Tabular.git'
Bundle 'https://github.com/vim-scripts/ShowTrailingWhitespace.git'
Bundle 'https://github.com/vim-scripts/DeleteTrailingWhitespace.git'

""" syntax highlight plugins
Bundle 'Yggdroot/indentLine'

""" file manange plugins
Bundle 'https://github.com/vim-scripts/The-NERD-tree.git'
Bundle 'https://github.com/vim-scripts/ctrlp.vim.git'
Bundle 'https://github.com/vim-scripts/grep.vim.git'

""" source code browse plugins
Bundle 'https://github.com/vim-scripts/Tagbar.git'
Bundle 'https://github.com/vim-scripts/cscope.vim'

""" colorscheme plugins
Bundle 'https://github.com/vim-scripts/Solarized.git'

""" status line plugins

""" auto complete plugins
Bundle 'Valloric/YouCompleteMe'

""" programming related plugins
Bundle 'https://github.com/vim-scripts/indentpython.vim.git'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" color settings
set t_Co=256
set background=dark
if has("gui_running")
    set guioptions=gR
    set mousemodel=popup
endif
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting line number
set number
set numberwidth=5
hi MatchParen ctermbg=blue ctermfg=white
hi VertSplit ctermbg=black ctermfg=black
""" setting status line
hi StatusLine ctermfg=darkgray ctermbg=blue
hi StatusLineNC ctermfg=black ctermbg=white
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" key mapping settings
let mapleader="\<space>"
nmap <s-j> <c-w>j
nmap <s-k> <c-w>k
nmap <s-h> <c-w>h
nmap <s-l> <c-w>l
nmap <c-j> <c-w>j<c-w>_
nmap <c-k> <c-w>k<c-w>_
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting grep plugin
let Grep_Skip_Files = '.git *.bak *~ *tags'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ShowTrailingWhitespace plugin
hi ShowTrailingWhitespace ctermbg=Red guibg=Red
""" setting DeleteTrailingWhitespace plugin
let g:DeleteTrailingWhitespace=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting tagbar plugin
let g:tagbar_width = 28
let g:tagbar_autoclose = 0
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
noremap  <silent> <F12> :TagbarToggle<CR>
inoremap <silent> <F12> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting NRED file explorer
let NERDTreeWinSize = 28
let NERDTreeWinPos = "left"

""if has('autocmd')
""    autocmd VimEnter * NERDTree
""    autocmd VimEnter * wincmd p
""endif
" exit if NERDTree is the last window
if has('autocmd')
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif
nnoremap <leader>t :NERDTree<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting YouCompleteMe plugin
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0

let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_collect_identifiers_from_tags_files=1
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting indentLine plugin
let g:indentLine_char='┆'
let g:indentLine_color_term=239
let g:indentLine_concealcursor='vc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
