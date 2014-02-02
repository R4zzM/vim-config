let maplocalleader="\\"

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
set statusline+=\ -\ 
set statusline+=%{fugitive#statusline()}

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

" vnoremap {{{

" Go to beginning and end of current line
vnoremap H ^
vnoremap L $

" Insert quotes and empa.. 
vnoremap <Leader>em c**<esc>P
vnoremap <Leader>qo c""<esc>P

" I don't get the point of this command...
" vunmap s

" Surround visually selected text
vnoremap s( c()<esc>P
vnoremap s) c()<esc>P
vnoremap s[ c[]<esc>P
vnoremap s] c[]<esc>P
vnoremap s{ c{}<esc>P
vnoremap s} c{}<esc>P
vnoremap s' c''<esc>P
vnoremap s* c**<esc>P
vnoremap s" c""<esc>P

" Align
vnoremap <Leader>at :Align\|<CR>

" Indentation without loosing selection
vnoremap > >gv 
vnoremap < <gv 

" }}}

" inoremap {{{

" Fundamental ESC remappings!
inoremap jk <esc>
" inoremap fd <esc>

" Swedish Programmer experiment
inoremap aa å
inoremap AA Å
inoremap Aa Å
inoremap ae ä
inoremap AE Ä
inoremap Ae Ä
inoremap oe ö
inoremap OE Ö
inoremap Oe Ö

" Double quotationmarks => Put cursor inbetween (v = qvote ;)
inoremap <c-v> ""<esc>i
inoremap '' ''<esc>i

" Insert block (and automatically closes current line, see above)
inoremap <c-b> <esc>g_a<space>{}<left><CR><CR><backspace><up><c-t>

" Simple movement in insertmode by holdning control
inoremap <c-h> <c-o>h
inoremap <c-j> <c-g>j
inoremap <c-k> <c-g>k
inoremap <c-l> <c-o>l

" Doubletapping *any* parenthesis button generates pair and puts cursor inside
inoremap (( ()<esc>i
inoremap )) ()<esc>i
inoremap {{ {}<esc>i
inoremap }} {}<esc>i
inoremap [[ []<esc>i
inoremap ]] []<esc>i

" For Vimwiki purposes to override the above.
" Maybe {{ should be removed in .vim files now that I think about it...

inoremap {{{ {{{<right>
inoremap }}} }}}<right>

" }}}

" nnoremap {{{

" Format paragraph to be shorter than tw
nnoremap <leader>f gqap

" Make scrolling be more smooth. 20 Lines at a time "
nnoremap <c-u> <C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up><C-Y><up>

nnoremap <c-d> <C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down><C-E><down>

" Go to end of line and beginning of line 
nnoremap L $
nnoremap H ^

" Simplify navigation between views
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Use for easymotion
nnoremap <c-f> <NOP>

" }}}

" onoremap {{{

" Inside parenthesis 
onoremap p i(

" Inside the next parenthesis on the same line
onoremap np :call NextParenthesis()<CR>

" Inside current quotes 
onoremap qo i"

" Inside next quotes on the same line
onoremap nqo :call NextQuote()<CR>

" End / Beginning of line
onoremap H ^
onoremap L $

" }}}

" Leader commands {{{
  
" Use space as <Leader>
" unmap <space>
let mapleader="\<space>"

" [s]av[e] command
nnoremap <Leader>se :w<CR>

" [qu]it with force command 
nnoremap <Leader>qu :q!<CR>

" [t]ab[c]close and [b]uffer[d]elete
nnoremap <Leader>tc :tabclose!<CR>
nnoremap <Leader>bd :bd!<CR>

" Edit .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Edit .vim/after/ftplugin/[filetype].vim for the type of buffer 
nnoremap <Leader>eft :call OpenFtPluginFile(&ft)<CR>

" Source the current file in the current buffer
nnoremap <Leader>sv :source %<CR>

" Init search with CtrlP plugin
nnoremap <Leader>p :CtrlPMixed<CR>

" Start a full build (Depends on Dispatch plugin)
nnoremap <Leader>mk :Make<CR>

" Clearcase stuff for systems that has that installed...
nnoremap <Leader>cco :setlocal autoread<CR>:!ct co -nc %<CR>
nnoremap <Leader>cci :!ct ci -nc %<CR>
nnoremap <Leader>ccu :!ct unco %<CR>
nnoremap <Leader>ccls :!ct lsco -me -recurse -short<CR>
nnoremap <Leader>cclsa :!ct lsco -me -all -short<CR>
nnoremap <Leader>ccia :!ct lsco -me -recurse -short \| xargs ct ci -nc<CR>

" Git stuff (Depends on fugitive plugin)
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gs :Gstatus<CR> 
nnoremap <Leader>gd :Gdiff<CR> 

" Manage sessions (Depends on SessionMan plugin)
nnoremap <Leader>sl :SessionList<CR>
nnoremap <Leader>ss :SessionSave<CR>

" Show Taglist (depends on exuberant ctags and taglist plugin)
nnoremap <Leader>tl :TlistToggle<CR>

" Show NERDTree (depends on NERDTree plugin)
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Ack work under cursor. Depends on Ack.
nnoremap <Leader>ack :Ack <cword><CR>

" Fast access to VIM builtin functions
nnoremap <Leader>api :help function-list<CR>

" }}}

" Abberivations {{{

" Vim
inoreabbrev iab inoreabbrev
inoreabbrev nno nnoremap
inoreabbrev ino inoremap
inoreabbrev ono onoremap
inoreabbrev vno vnoremap
inoreabbrev nor noremap

" Words
iabbrev doesnt doesn't
iabbrev dont don't
iabbrev wasnt wasn't
iabbrev taht that
iabbrev Strign String
iabbrev Isntance Instance
iabbrev isntance instance
iabbrev getIsntance getInstance

" }}}

" Plugin: Pathogen {{{

" Load the plugins
execute pathogen#infect()

" Load the documentation for the plugins
execute pathogen#helptags()

"}}}

" Plugin: Syntastic {{{ 

let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_quiet_messages = {'level' : 'warnings'}

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

" Plugin: Easymotion {{{

" Use c-f for easymotion
let g:EasyMotion_leader_key = '<C-f>'

" }}}

" Theme {{{

" Set the theme. I think I got this one from vivify.
colorscheme Dim2

" }}}

" Support Functions {{{

" Go to the next word but don't change line
" function! NextWordNoLineChange()
"   let line_before_jump = line(".")
"   execute "normal! E"
"   let line_after_jump = line(".")
"   if(line_before_jump !=# line_after_jump)
"     execute "normal! \<up>$"
"   endif
" endfunction

" Go to the previous word but don't change line
" function! PrevWordNoLineChange()
"   let line_before_jump = line(".")
"   execute "normal! B"
"   let line_after_jump = line(".")
"   if(line_before_jump !=# line_after_jump)
"     execute "normal! W"
"   endif
" endfunction

" Open the ftplugin file for the current ft
function! OpenFtPluginFile(ft)
  let path  = $HOME . "/.vim/ftplugin/" . a:ft . "/" . a:ft . ".vim"
  execute "normal! :vsplit " . path . "\<CR>"
endfunction

" Movement to the next parenthesis. 
" 'dummy' is first inserted so that something can be selected incase it is
" empty. It is always removed. Time will tell if this breaks something.
function! NextParenthesis()
  execute "normal! f(adummy\<esc>"
  execute "normal! F(\<right>vt)"
endfunction

" Same as with NextParenthesis() above but for doublequotes
function! NextQuote()
  execute "normal! f\"adummy\<esc>"
  execute "normal! F\"\<right>vt\""
endfunction
" }}}
