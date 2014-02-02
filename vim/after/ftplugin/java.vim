" \ is the local leader
let maplocalleader = "\\"

" Highlight the word under the cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

inoremap <c-b> {}<left><CR><CR><backspace><up><c-t>
iabbrev psf public static final
iabbrev ps public static

