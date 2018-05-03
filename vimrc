""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" plugin mananger
set nocompatible
filetype off

call plug#begin('~/.vim/favorites')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'sheerun/vim-polyglot'

""" edit assistant plugins
Plug 'Raimondi/delimitMate'
Plug 'ntpeters/vim-better-whitespace'

""" syntax highlight plugins
Plug 'Yggdroot/indentLine'

""" status line
 Plug 'itchyny/lightline.vim'

""" file manange plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'rking/ag.vim'
Plug 'dkprice/vim-easygrep'

""" source code browse plugins
Plug 'majutsushi/tagbar'

""" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

""" auto complete plugins
Plug 'Valloric/YouCompleteMe'

""" programming related plugins
Plug 'fatih/vim-go', { 'tag': '*' }

""" other
Plug 'christoomey/vim-tmux-navigator'

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

set title
set wildmenu
set ttyfast
set lazyredraw

set pastetoggle=<F9>
set clipboard=unnamed
set mouse=a

set encoding=utf-8
set termencoding=utf-8

set noerrorbells
set novisualbell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" color settings
syntax on
set t_Co=256
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if has("gui_running")
    set guioptions=g
    set mousemodel=popup

    if g:os == "Darwin"
        "set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h18'
        set guifont=Fira\ Mono\ Medium\ for\ Powerline:h18
    elseif g:os == "Linux"
        set guifont=Fira\ Mono\ 21
    elseif g:os == "Windows"
        set guifont=Fira_Mono:h21:cANSI
    endif
endif
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
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
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

if has("gui_running")
    nnoremap <C-Tab>   :tabn<CR>
    nnoremap <C-S-Tab> :tabp<CR>
    inoremap <C-Tab>   <Esc>:tabn<CR>
    inoremap <C-S-Tab> <Esc>:tabp<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting better-whitespace plugin
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

hi ExtraWhitespace ctermbg=Red guibg=Red
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting tagbar plugin
let g:tagbar_width = 25
let g:tagbar_autoclose = 0
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

nnoremap <leader>l :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting NRED file explorer
let NERDTreeWinSize = 25
let NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$']

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
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1

nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting indentLine plugin
let g:indentLine_char='┆'
let g:indentLine_concealcursor='vc'
let g:indentLine_color_term=239
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting ctrlp plugin"
let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode  = 'ra'
if executable('ag')
    let g:ctrlp_use_caching=0
    let g:ctrlp_user_command='ag %s -l --depth 5 --nocolor --nogroup --hidden --ignore .git --ignore vendor --ignore .DS_Store -g ""'
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
let g:ag_prg="ag --vimgrep --ignore locale --ignore test*"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting lightline plugin
set laststatus=2
let g:lightline = {'colorscheme': 'solarized'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting vim-go plugin
let g:go_fmt_command = "goimports"

let g:go_term_mode = "split"
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!
  """ show by default 8 spaces for a tab
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting markdown plugins
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_new_list_item_indent = 2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" setting easygrep plugin
let g:EasyGrepCommand=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
