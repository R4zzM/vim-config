set nocompatible
filetype off

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-dispatch.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-unimpaired.git'

Bundle 'scrooloose/syntastic'
" Bundle 'scrooloose/nerdtree'

Bundle 'vim-scripts/vimwiki.git'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/sessionman.vim'

Bundle 'kien/ctrlp.vim.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
