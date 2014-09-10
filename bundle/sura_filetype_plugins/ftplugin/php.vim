
map <silent> <F6> :wall<ENTER>:call RunAllPhpTests()<ENTER>
imap <silent> <F6> <ESC><F6>

map <silent> <F7> :wall<ENTER>:call RunCurrentFileTests()<ENTER>
imap <silent> <F7> <ESC><F7>

map <silent> <F8> :wall<ENTER>:call RunLastFileTests()<ENTER>
imap <silent> <F8> <ESC><F8>

map <silent> <F9> :call PhpToggleTestImpl()<ENTER>
imap <silent> <F9> <ESC><F9>

map <C-Q> ^ivar_dump(<ESC>$:.s/;$//e<ENTER>$a);<ESC>
imap <C-Q> <ESC><C-Q>

map gs :call GotoServiceDefinition()<ENTER>

command! AddField execute "normal mayiw[{oprivate $;\<ESC>P`a]mo$this->\<ESC>pa = $;\<ESC>P`a"

compiler phpunit
set foldmethod=marker
set si

