let localleader = '\<backspace>'

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal smartindent

" String maching
inoremap <c-e>m =~<space>m//<left>

" String substitution
inoremap <c-e>s =~<space>s///<left><left>

" This is really bad! I should use snippets instead!!

" Attach an elsif() to the current block
inoremap <c-e>i <esc>/}<cr>a<space>elsif()<space>
               \{}<left><CR><backspace>
               \<esc>?)<cr>i

" Attach an else to the current block
inoremap <c-e>l <esc>/}<cr>a<space>else<space>
               \{}<left><CR><CR><backspace><up><c-t>
