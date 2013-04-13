
map <silent> <F5> :wall<ENTER>:AsyncMake<ENTER>
imap <silent> <F5> <ESC><F5>

map <C-Q> ^ivar_dump(<ESC>$:.s/;$//e<ENTER>$a);<ESC>
imap <C-Q> <ESC><C-Q>

compiler phpunit
set foldmethod=marker
set si

