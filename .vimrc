set nocompatible
filetype off  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'tpope/vim-surround.git'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'MicahElliott/vrod'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'
Bundle 'wlangstroth/vim-racket'
Bundle 'tomasr/molokai.git'

filetype on
filetype indent on
filetype indent on
filetype plugin indent on "required!

set number  "显示行号
set ruler
set magic
set history=100
syntax enable
syntax on

set ignorecase "搜索是忽略大小写
set smartcase
set wildmenu
set incsearch
set hlsearch
set lbr
set mouse-=a
set selection=inclusive
set clipboard+=unnamed

set ruler
set nobackup "取消备份文件
set noswapfile
set nowritebackup
set dy=lastline
set showmatch
set showcmd
set scrolloff=3
set autowrite
set magic
set showtabline=1
set autoread

set noeb
set novisualbell
set autoindent
set cindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround

" F3启动/关闭nerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>