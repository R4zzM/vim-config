" Add autoclose for brackets and quotes
" inoremap ( ()<Esc>i
" inoremap () ()<Esc>i  
" inoremap [ []<Esc>i
" inoremap [] []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" { requires some special treatment using autoindent
" inoremap { {<CR><CR><BS>}<Esc>ki<Tab>

" Indent rules
set expandtab
set shiftwidth=8
set softtabstop=8

" Compile single file
" nnoremap <Leader>q :!gcc -o %:r %<CR>
setl makeprg=gcc\ -o\ %:r\ %

