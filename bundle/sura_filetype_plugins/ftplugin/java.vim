
map <silent> <F5> :call Make() \| cw<ENTER>
map <silent> <F6> :call Exec("make exec", 1, 0)<ENTER>
map <silent> <F7> <F5>:call Exec("make exec", 1, 1)<ENTER>
map <silent> <F8> :call Exec("make jar", 1, 0)<ENTER>

imap <silent> <F5> <ESC><F5>
imap <silent> <F6> <ESC><F6>
imap <silent> <F7> <ESC><F7>
imap <silent> <F8> <ESC><F8>

set cin
syntax on
filetype plugin on
filetype detect
set foldmethod=marker

