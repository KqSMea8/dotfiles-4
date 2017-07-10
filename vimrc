""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugin mananger
filetype off
call plug#begin('~/.vim/favorites')

Plug 'tpope/vim-sensible'

""" edit assistant plugins
Plug 'https://github.com/vim-scripts/AutoClose.git'
Plug 'https://github.com/vim-scripts/Tabular.git'
Plug 'https://github.com/vim-scripts/ShowTrailingWhitespace.git'
Plug 'https://github.com/vim-scripts/DeleteTrailingWhitespace.git'

""" syntax highlight plugins
Plug 'Yggdroot/indentLine'

""" status line
 Plug 'itchyny/lightline.vim'

""" file manange plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/vim-scripts/ctrlp.vim.git'
Plug 'https://github.com/dyng/ctrlsf.vim'
Plug 'https://github.com/rking/ag.vim'

""" source code browse plugins
Plug 'https://github.com/vim-scripts/Tagbar.git'

""" auto complete plugins
Plug 'Valloric/YouCompleteMe'

""" programming related plugins
Plug 'https://github.com/vim-scripts/indentpython.vim.git'

""" plugin finish
call plug#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" global settings
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
set encoding=utf-8
set termencoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" color settings
syntax on
set t_Co=256

if has("gui_running")
    set guioptions=g
    set mousemodel=popup
    set guifont=Monaco:h16
    autocmd VimEnter * exe 'cd ~/Codes/github/openstack'
endif
set background=dark
colorscheme solarized
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
""" setting grep command
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting line number
set number
set numberwidth=5
hi VertSplit ctermbg=black ctermfg=black
hi MatchParen ctermbg=blue ctermfg=white
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" key mapping settings
let mapleader="\<space>"
nmap <s-j> <c-w>j
nmap <s-k> <c-w>k
nmap <s-h> <c-w>h
nmap <s-l> <c-w>l
nmap <c-j> <c-w>j<c-w>_
nmap <c-k> <c-w>k<c-w>_

vmap <Leader>y "+y
nmap <Leader>p "+p

nnoremap <C-Tab>   :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ShowTrailingWhitespace plugin
hi ShowTrailingWhitespace ctermbg=Red guibg=Red
""" setting DeleteTrailingWhitespace plugin
let g:DeleteTrailingWhitespace=1
let g:DeleteTrailingWhitespace_Action = 'delete'
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

if has('autocmd')
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

nnoremap <leader>t :NERDTreeToggle<CR>
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
""" setting ctrlp plugin"
let g:ctrlp_working_path_mode  = 'ra'
if executable('ag')
    let g:ctrlp_use_caching=0
    let g:ctrlp_user_command='ag %s -l --nocolor --nogroup --hidden --ignore .git --ignore .DS_Store -g ""'
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ctrlsf plugin"
let g:ctrlsf_auto_close = 0
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_ignore_dir = ['tests', 'doc', '.git']

nnoremap <leader>o :CtrlSFToggle<CR>
nmap <leader>f <Plug>CtrlSFCwordPath
vmap <leader>f <Plug>CtrlSFVwordPath
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ag plugin
let g:ag_working_path_mode="r"
let g:ag_prg="ag --ignore .git --ignore locale --ignore tests --vimgrep"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
