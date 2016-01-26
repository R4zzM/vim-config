set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'kovisoft/slimv'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-surround.git'

Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/vimwiki.git'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/Conque-GDB'
     
Plugin 'kien/ctrlp.vim.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-generator'
Plugin 'mileszs/ack.vim'
Plugin 'sotte/presenting.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rhysd/vim-clang-format'

call vundle#end()
filetype plugin indent on
