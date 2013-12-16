:let mapleader = ","

set nocompatible
set ma
set t_Co=256
set nu
set hls
set modifiable
set expandtab tabstop=4 shiftwidth=4
syntax on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
" The bundles you install will be listed here
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shutnik/jshint2.vim'

filetype plugin indent on

" The rest of your config follows here
"
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=Grey guibg=Grey
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4
    autocmd FileType javascript setlocal noexpandtab tabstop=4 shiftwidth=4 autoindent
augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ 10
set laststatus=2

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore = ['\.pyc$']

map <F2> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

let g:pymode_rope = 0

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint"
let g:pymode_lint_ignore = "C0301,C0103,C1001,C0111,E1120,E1101,W0232,R0201,R0901,R0903,R0904"
" Auto check on save
let g:pymode_lint_write = 1

let jshint2_command = '/usr/local/bin/jshint'
"let jshint2_save = 1

" Enable molokai color scheme
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬

" automatically change window's cwd to file's dir
set autochdir

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

"colorscheme mustang
" colorscheme slate

colorscheme lucius
LuciusWhite

if !exists(":DiffOrig")
        command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
    endif
