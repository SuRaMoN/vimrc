
map <silent> <F6> :wall<ENTER>:ccl<ENTER>:AsyncMake<ENTER>
imap <silent> <F6> <ESC><F6>

map <silent> <F7> :wall<ENTER>:ccl<ENTER>:execute ":AsyncMake " . expand("%")<ENTER>
imap <silent> <F7> <ESC><F7>

map <C-Q> ^ivar_dump(<ESC>$:.s/;$//e<ENTER>$a);<ESC>
imap <C-Q> <ESC><C-Q>

compiler phpunit
set foldmethod=marker
set si

