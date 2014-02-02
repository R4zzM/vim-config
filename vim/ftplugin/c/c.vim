" Add autoclose for brackets and quotes
inoremap ( ()<Esc>i
inoremap () ()<Esc>i  
inoremap [ []<Esc>i
inoremap [] []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" { requires some special treatment using autoindent
inoremap { {<CR><CR><BS>}<Esc>ki<Tab>
