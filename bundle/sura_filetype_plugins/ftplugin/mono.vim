
map <silent> <F5> :call Make() \| cw<ENTER>
map <silent> <F6> :call Exec("make exec", 1, 0)<ENTER>
map <silent> <F7> <F5>:call Exec("make exec", 1, 1)<ENTER>

imap <silent> <F5> <ESC><F5>
imap <silent> <F6> <ESC><F6>
imap <silent> <F7> <ESC><F7>

set cin
syntax on
filetype plugin on
filetype detect
set foldmethod=marker

