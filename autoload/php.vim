
map <C-Q> ^ivar_dump(<ESC>$:.s/;$//e<ENTER>$a);<ESC>
imap <C-Q> <ESC><C-Q>

map gs :call GotoServiceDefinition()<ENTER>
map tsc :call ToSnakeCase()<ENTER>

command! AddField execute "normal mayiw[{oprivate $;\<ESC>P`a]mo$this->\<ESC>pa = $;\<ESC>P`a"
