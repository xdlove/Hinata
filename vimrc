" Copyright (C) XuDong Lin (xdlove), Inc.

"==============================基础VIM设置=============================="
set number  "显示行号
set ai  "(autoindent)自动缩排 set ci  "使用C的缩进方式
set si  "智能缩进
sy on   "语法高亮
sy enable
set history=1000
set tabstop=4 "设置tab宽度为4个空格
set expandtab
set shiftwidth=4
set softtabstop=4 "使用退格键一次可以删除4个空格
set textwidth=79
set ff=unix
"浅色显示当前行
"浅色显示当前列
set cursorline cursorcolumn
au WinEnter * set cursorline cursorcolumn
au BufEnter * set cursorline nocursorcolumn
au InsertEnter * set cursorline cursorcolumn
au InsertLeave * set nocursorcolumn
nnoremap H ^
nnoremap L $
set showcmd
set mouse=a
set nobackup    "不备份
set encoding=utf-8 "文件编码使用UTF8
set noswapfile "不使用交换文件
set autowrite "自动保存
set nocompatible "不兼容vi 可以用退格键删除字符
set backspace=2
set autochdir

"Vim Tmux compatible
if exists('$TMUX')
  set term=screen-256color
endif

"==============================文本检索设置=========================="
"高亮显示所有匹配串
set hlsearch
"取消高亮
nohlsearch
"按CTRL+y关闭高亮的串
noremap <silent> <C-y> :nohlsearch<Bar>:echo<CR>
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch "输入搜索内容时即显示结果

"==============================其他设置=============================="
"快速在多个屏幕之间切换
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
"其他屏幕相关
noremap <C-q> <C-w>q
noremap <C-c> <C-w>c
noremap ^L ^wL
noremap ^J ^wJ
noremap ^K ^wK
noremap ^H ^wH
noremap ^= <C-w>=
noremap ^- <C-w>-
noremap ^+ <C-w>+



if has('gui_running')
    set background=dark
    " colorscheme solarized
    colorscheme gruvbox
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set guioptions-=r
    set guioptions-=L

else
    set background=dark
    "colorscheme molokai
    colorscheme solarized
    " colorscheme gruvbox
endif

au WinEnter,BufUnload,BufEnter,BufHidden,BufWinEnter,BufRead,BufNewFile *.conf setfiletype nginx
autocmd BufRead,BufNewFile *.zt set filetype=ztest

set fillchars+=vert:\

"==============================插件设置=============================="
"Vundle manage the plugin
filetype off

set rtp+=~/.vim/Vundle.vim
call vundle#begin()

"颜色主题设置
set laststatus=2
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/nginx.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"enable modified detection >
let g:airline_detect_modified=1

"enable paste detection
let g:airline_detect_paste=1

"enable crypt detection
let g:airline_detect_crypt=1

"enable spell detection
let g:airline_detect_spell=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

map <tab> :bn <CR>
map <s-tab> :bp <CR>
set t_Co=256
let g:airline_enable_branch      = 1
let g:airline_enable_syntastic   = 1
let g:airline_powerline_fonts    = 1
let g:airline_theme              = 'solarized'
" let g:airline_theme              = 'gruvbox'
let g:airline_left_sep           = ''
let g:airline_left_alt_sep       = ''
let g:airline_right_sep          = ''
let g:airline_right_alt_sep      = ''
let g:airline_symbols.crypt      = '🔒'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"nerdtree
Plugin 'scrooloose/nerdtree'
"F3 切换Nerdtree
map <F3> :NERDTreeToggle <CR>
imap <F3> <ESC>:NERDTreeToggle <CR>

"Python插件
"Plugin 'vim-scripts/indentpython.vim'

"YCM
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='/home/vagrant/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path='/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion=1
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_indentifiers_from_tags_files=1 "开启YCM基于标签引擎
let g:ycm_seed_identifiers_with_syntax=1 "语法关键字补全
let g:ycm_min_num_of_chars_for_completion=2 "从第2个键入字符开始罗列匹配信息
let g:ycm_complete_in_comments = 1 "注释里也可补全
let g:ycm_complete_in_strings = 1 "字符串也可以
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释信息和字符串信息收入补全
let mapleader = 'y'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"Plugin 'django.vim'
"au BufNewFile,BufRead *.html set filetype=htmldjango
"使用空格代码折叠
set foldmethod=indent "根据缩紧折叠代码
set foldlevel=99
nnoremap <space> za
"Plugin 'tmhedberg/SimpylFold'
"let g:SimpylFold_docstring_preview=1
"语法检查
Plugin 'scrooloose/syntastic'
" 设置错误符号
let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=0
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

Plugin 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 500
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let python_highlight_all=1
"auto close
"支持PEP8风格,其他设置见上
set fileformat=unix
Plugin 'spf13/vim-autoclose'
let g:autoclose_vim_commentmode = 1

Plugin 'vim-scripts/taglist.vim'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

"自动打开Tlist
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1 "当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Show_One_File = 1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_Process_File_Always = 1
map <silent> <F2> :TlistToggle<CR>
imap <F2> <ESC>:TlistToggle<CR>
set tags=tags;/
"垂直对齐线
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 10
let g:indentLine_char = '¦'

"buffer插件
"Plugin 'ap/vim-buftabline'
"let g:buftabline_separators = 1

"Large file
Plugin 'LargeFile'
Plugin 'skywind3000/vimmake'
"Plugin 'xolox/vim-lua-inspect'
"Plugin 'xolox/vim-misc'

"ack
Plugin 'mileszs/ack.vim'
" noremap <F5> :VimTool gcc<cr>
" inoremap <F5> <esc>:VimTool gcc<cr>
" noremap <F11> :VimTool run<cr>
" inoremap <F11> <esc>:VimTool run<cr>

"YCM"
call vundle#end()
filetype plugin indent on

"================================================================================
let maplocalleader = '-'
autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
autocmd FileType c nnoremap <buffer> <localleader>c I/*<space><esc>A<space>*/<esc>
autocmd FileType h nnoremap <buffer> <localleader>c I/*<space><esc>A<space>*/<esc>
autocmd FileType cpp nnoremap <buffer> <localleader>c I// <esc>
autocmd FileType lua nnoremap <buffer> <localleader>c I-- <esc> 
let mapleader = '`'
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <F4> :vertical resize +10<CR>
nnoremap <F5> :vertical resize -10<CR>
" highlight RedundantSpaces ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
"
"abbreviations
iabbrev slef self
iabbrev adn  and
iabbrev tpye type
iabbrev aelx alex
