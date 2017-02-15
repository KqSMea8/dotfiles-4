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
set wildmenu
set lazyredraw
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
Plugin 'gmarik/vundle'

""" edit assistant plugins
Plugin 'https://github.com/vim-scripts/AutoClose.git'
Plugin 'https://github.com/vim-scripts/Tabular.git'
Plugin 'https://github.com/vim-scripts/ShowTrailingWhitespace.git'
Plugin 'https://github.com/vim-scripts/DeleteTrailingWhitespace.git'

""" syntax highlight plugins
Plugin 'Yggdroot/indentLine'

""" file manange plugins
Plugin 'https://github.com/vim-scripts/The-NERD-tree.git'
Plugin 'https://github.com/vim-scripts/ctrlp.vim.git'
Plugin 'https://github.com/dyng/ctrlsf.vim'
Plugin 'EasyGrep'

""" source code browse plugins
Plugin 'https://github.com/vim-scripts/Tagbar.git'
Plugin 'https://github.com/vim-scripts/cscope.vim'

""" colorscheme plugins
Plugin 'https://github.com/vim-scripts/Solarized.git'

""" status line plugins

""" auto complete plugins
Plugin 'Valloric/YouCompleteMe'

""" programming related plugins
Plugin 'https://github.com/vim-scripts/indentpython.vim.git'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" color settings
set t_Co=256
set background=dark
if has("gui_running")
    set guioptions=g
    set mousemodel=popup
    set guifont=Monaco:h16
    autocmd VimEnter * exe 'cd ~/Codes/github/openstack'
endif
colorscheme solarized
""colorscheme darkblue
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting line number
set number
set numberwidth=5
hi VertSplit ctermbg=black ctermfg=black
hi MatchParen ctermbg=blue ctermfg=white
""" setting status line
hi StatusLine ctermfg=darkgray ctermbg=gray
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
nmap <Leader>r :source ~/.vimrc<CR>
vmap <Leader>y "+y
nmap <Leader>p "+p
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
nnoremap <leader>l :TagbarToggle<CR>
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
let g:ycm_min_num_of_chars_for_completion=2
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
""" setting grep command
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ctrlp plugin"
let g:ctrlp_user_command='ag %s -l --nocolor --nogroup --hidden
                                 \ --ignore .git --ignore out
                                 \ --ignore .svn --ignore .hg
                                 \ --ignore .DS_Store -g ""'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ctrlsf plugin"
let g:ctrlsf_auto_close = 0
let g:ctrlsf_winsize = '40%'
let g:ctrlsf_position = 'right'
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_default_root = 'project'

nnoremap <leader>o :CtrlSFToggle<CR>
nmap <leader>f <Plug>CtrlSFCwordPath
vmap <leader>f <Plug>CtrlSFVwordPath
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting EasyGrep plugin
let g:EasyGrepMode = 0               " All:0, Open Buffers:1, TrackExt:2
let g:EasyGrepCommand = 1            " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive  = 1         " Recursive searching
let g:EasyGrepIgnoreCase = 1         " not ignorecase:0
let g:EasyGrepJumpToMatch = 0        " Jump to first match
let g:EasyGrepFilesToExclude = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
