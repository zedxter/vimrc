set nu
set t_Co=256
set expandtab tabstop=4 shiftwidth=4
syntax on
set hlsearch
set background=dark
set nocompatible
set backspace=2
set mouse=a
set fileformats=unix,mac,dos
set ignorecase
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'crusoexia/vim-monokai'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'othree/html5.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-ruby/vim-ruby'
call vundle#end()

filetype plugin indent on

let mapleader=","

"let g:syntastic_check_on_open=1
"let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_html_tidy_ignore_errors = [
    \ 'trimming empty <i>',
    \ 'trimming empty <span>',
    \ '<input> proprietary attribute \"autocomplete\"',
    \ 'proprietary attribute \"role\"',
    \ 'proprietary attribute \"hidden\"',
    \ 'proprietary attribute \"ng-',
    \ '<svg> is not recognized!',
    \ 'discarding unexpected <svg>',
    \ 'discarding unexpected </svg>',
    \ '<rect> is not recognized!',
    \ 'discarding unexpected <rect>'
\ ]
let g:syntastic_javascript_checkers = ['eslint']


let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_focus_on_files = 1
map <F2> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|release\|build'

" Colorscheme
colorscheme monokai

" Some automation
autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd BufRead,BufNewFile *.xsjs setfiletype javascript
autocmd BufRead,BufNewFile *.xsjslib setfiletype javascript

autocmd FileType javascript setlocal omnifunc=tern#Complete

autocmd BufRead,BufNewFile *.html.erb setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Remove whitespaces at EOL
autocmd BufWritePre * :%s/\s\+$//e

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
ca formatjson %!python -m json.tool

" Exclude built files for maven projects in ctrlp
set wildignore+=*/target/*

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
