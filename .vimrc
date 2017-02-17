" Copyright (C) XuDong Lin (xdlove), Inc.

"============================基础vim配置===================================
set number
set ai
set si
sy on
set t_Co=256
sy enable
set laststatus=2
set history=1000
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=79
set ff=unix
set showcmd
set mouse=a
set nobackup
set encoding=utf-8
set noswapfile
set autowrite
set nocompatible
set backspace=2
set autochdir
set pastetoggle=<F9>

set cursorline cursorcolumn
au WinEnter     * set cursorline cursorcolumn
au BufEnter     * set cursorline nocursorcolumn
au InsertEnter  * set cursorline cursorcolumn
au InsertLeave  * set nocursorcolumn

if exists('$TMUX')
    set term=screen-256color
endif

set background=dark
colorscheme solarized

"=============================文本检索配置=================================
set hlsearch
set ignorecase smartcase
set incsearch

"============================快捷键配置====================================
let mapleader=";"
nnoremap <leader>j ^
nnoremap <leader>k $
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

nnoremap <leader>ak :Ack<space>
nnoremap <leader>ag :Ag<space>
nnoremap <leader>st :set<space>
nnoremap <leader>tb :Tab/
nnoremap <leader>py :! python %<space>

nnoremap [h <Plug>GitGutterPrevHunk
nnoremap ]h <Plug>GitGutterNextHunk
nnoremap <leader>3  :NERDTreeToggle <CR>
nnoremap <leader>1  :GitGutterToggle <CR>

nnoremap <leader><space> :set nohlsearch<CR>
nnoremap <leader>z :call Zoom()<CR>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k

inoremap <leader>j ?
inoremap <leader>k *

inoremap jk <C-[>
vnoremap jk <C-[>

vnoremap <leader>j ^
vnoremap <leader>k $

"=============================插件配置=====================================
filetype off
set rtp+=~/.vim/Vundle.vim

call vundle#begin()

Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'vim-scripts/Pydiction'
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'

Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term=0
let g:indentLine_char='¦'

Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/nginx.vim'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

call vundle#end()
filetype plugin indent on

"=============================最大化窗口==================================
" http://lotabout.me/2015/Vim-%E6%9C%80%E5%A4%A7%E5%8C%96%E5%BD%93%E5%89%8D%E7%AA%97%E5%8F%A3/
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose
        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

"=============================函数配置====================================

function g:FileTypeColor()
    set ft=nginx
endfunction

au BufRead,BufNewFile *.conf call g:FileTypeColor()
