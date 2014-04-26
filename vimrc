augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Actually I only want rc.lua to behave like this. What should I do?
augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal foldmethod=marker
augroup END

" Re-generate the html page when the buffer is saved
augroup filetype_wiki
  autocmd!
  autocmd BufWritePost *.wiki :silent Vimwiki2HTML
augroup END

" Editor configuration {{{

" Init bundle
source ~/.vim/bundles.vim

" If this file is read this options is already set. More of a statement...
set nocompatible

" Use highlightnig of text depending on filetype.
syntax on

" Read custom filetype configuration from ~/.vim/ftplugin/
filetype plugin on

" Show line numbers
set number
 
" Start searching as soon as text is typed after an '/'
set incsearch

" Highlight all search matches
set hlsearch

" Automatically indent files (that should be indented)) when coding.
set autoindent
set smartindent

" Use spaces instead of tabs
" To insert tabs (needed e.g in makefiles) I first press <CTRL-v> followed by
" <TAB> 
set expandtab
set shiftwidth=2
set softtabstop=2

" Max 79 chars per line. Vizualize.
set textwidth=79
set colorcolumn=80

" Left, right and backspace keys wraps the cursor
set whichwrap+=<,>,h,l 

" Backspace erases. Everything else is just strange.
set backspace=2 

" Ignore interpretation of remapped keys when pasting into buffer
set mouse=a

" Share clipboard with X if available
set clipboard=unnamedplus

" Show command in status line
set showcmd

" Ignore in filesearch and completion
set wildignore+=*.swp,*.class,*.jar,*.tar,*.jpg

" Always show the statusline
set laststatus=2

" Modify the statusline
set statusline=%F
set statusline+=\ -\ 
set statusline+=%y
set statusline+=\ -\ 
set statusline+=%l/%L

" Add autocompletion menu in command mode
set wildmode=full
set wildmenu 

" Keep cursor close to the middle of the screen
set scrolloff=18

" No autocommenting. It's just annoying.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't keep options over sessions as it often conflicts with newer versions of 
" .vimrc
set sessionoptions-=options

" Don't create .swp or backup files. They just cause trouble when the same file
" is being edited from different computers.
set noswapfile
set nobackup

" }}}

" inoremap, vnoremap, nnoremap, onoremap {{{

" Speed up movement in vim wiki journal in the spirit of unimpaired
nnoremap [j :VimwikiDiaryPrevDay<CR>
nnoremap ]j :VimwikiDiaryNextDay<CR>

" Indentation without loosing selection
vnoremap > >gv 
vnoremap < <gv 

" Swedish Programmer experiment
inoremap aa å
inoremap AA Å
inoremap Aa Å
inoremap ae ä
inoremap AE Ä
inoremap Ae Ä
inoremap oi ö
inoremap OI Ö
inoremap Oi Ö

" Double quotationmarks => Put cursor inbetween (v = qvote ;)
" This is a really useful shortkey, but it shadows vim functionality. 
" Maybe there is another key that can be used instead?
inoremap <c-v> ""<esc>i

" Insert block (and automatically closes current line, see above)
inoremap <c-b> <esc>g_a<space>{}<left><CR><CR><backspace><up><c-t>

" Movement in insertmode by holdning control
inoremap <c-h> <c-o>h
inoremap <c-j> <c-g>j
inoremap <c-k> <c-g>k
inoremap <c-l> <c-o>l

" Change viewport by holding ctrl in normalmode
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Make scrolling be more smooth. 20 Lines at a time "
nnoremap <c-u> <C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up>

nnoremap <c-d> <C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down>

" }}}

" Leader commands {{{
  
" Use space as <Leader>
let mapleader="\<space>"

" [s]av[e] command
nnoremap <Leader>se :w!<CR>

" Edit .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Source the current file in the current buffer
nnoremap <Leader>sv :source %<CR>

" Start a full build (Depends on Dispatch plugin)
nnoremap <Leader>mk :Make<CR>

" Clearcase stuff for systems that has that installed...
nnoremap <Leader>cco :setlocal autoread<CR>:!ct co -nc %<CR>
nnoremap <Leader>cci :!ct ci -nc %<CR>
nnoremap <Leader>ccu :!ct unco %<CR>
nnoremap <Leader>ccls :!ct lsco -me -recurse -short<CR>
nnoremap <Leader>cclsa :!ct lsco -me -all -short<CR>
nnoremap <Leader>ccia :!ct lsco -me -recurse -short \| xargs ct ci -nc<CR>

" Manage sessions (Depends on SessionMan plugin)
nnoremap <Leader>sl :SessionList<CR>
nnoremap <Leader>ss :SessionSave<CR>

" Show Taglist (depends on exuberant ctags and taglist plugin)
nnoremap <Leader>tl :TlistToggle<CR>

" Ack work under cursor. Depends on Ack.
nnoremap <Leader>ack :Ack <cword><CR>

" Fast access to VIM builtin functions
nnoremap <Leader>api :help function-list<CR>

" }}}

" Plugin: CtrlP {{{

let g:ctrlp_show_hidden  = 1
let g:ctrlp_match_window = 'max:25'

" }}}

" Plugin: Taglist {{{

" Check if I have compiled exuberant ctags myself. If I have, I want to use
" it!
let custom_ctags = system("which " . $HOME . "/bin/ctags")
if(v:shell_error ==# 0)
  " echom "Taglist: Using /home/erasmat/bin/ctags"
  let Tlist_Ctags_Cmd='/home/erasmat/bin/ctags'
else
  let ctags_exec = system("which ctags")
  if(v:shell_error ==# 0)
    " echom "Taglist: Using " . ctags_exec
  else
    silent echom "Taglist error: Exuberent ctags not found!"
  endif
endif

highlight link MyTagListFileName TabLineSel
highlight link MyTagListTitle Special

" }}}

" Plugin: Vimwiki {{{

" Enable folding
" let g:vimwiki_folding = 'expr'

" Enable code highlighting 
let wiki                 = {}
let wiki.path            = '~/Dropbox/vimwiki'
let wiki.path_html       = '~/Dropbox/Public/vimwiki-html/'
let wiki.nested_syntaxes = {'python': 'python', 'perl': 'perl'}
let g:vimwiki_list       = [wiki]

" To make snipmate work in vimwiki files...
let g:vimwiki_table_mappings = 0

" }}}

" Theme {{{

" Set the theme. I think I got this one from vivify.
colorscheme Dim2

" }}}

" Support Functions {{{

" Open the ftplugin file for the current ft
function! OpenFtPluginFile(ft)
  let path  = $HOME . "/.vim/ftplugin/" . a:ft . "/" . a:ft . ".vim"
  execute "normal! :vsplit " . path . "\<CR>"
endfunction

" }}}
