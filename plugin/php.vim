
map <C-Q> ^ivar_dump(<ESC>$:.s/;$//e<ENTER>$a);<ESC>
imap <C-Q> <ESC><C-Q>

map gs :call GotoServiceDefinition()<ENTER>
map tsc :call ToSnakeCase()<ENTER>

command! AddField execute "normal mayiw[{oprivate $;\<ESC>P`a]mo$this->\<ESC>pa = $;\<ESC>P`a"

fu! ToSnakeCase()
    execute ":%s/\\%V\\\\/./g"
    execute ":%s/\\%V\\.\\([A-Z]\\)/.\\l\\1/g"
    execute ":%s/\\%V[A-Z]/_\\l\\0/g"
    execute ":%s/\\%V_//"
endfu

fu! GotoServiceDefinition()
    execute "vimgrep \"" . expand("<cword>") . "'\]\\s*=\" config/Config/*Configuration.php"
    if len(getqflist()) == 1
        ccl
    endif
endfu

