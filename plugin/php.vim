
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

fu! SwitchSymfonyController()
	if expand("%:t") =~ "actions\\.class\\.php$"
        execute "normal mw"
        execute "?n execute"
        let line = substitute(getline("."), ".*n execute\\(\\w*\\).*", "\\l\\1", "") . "Success.phtml"
        execute "normal 'w"
        execute "e " . expand("%:p:h") . "/../templates/" . line
	elseif expand("%:t") =~ "Success\\.php$" || expand("%:t") =~ "Success\\.phtml$"
        execute "e " . expand("%:p:h") . "/../actions/actions.class.php"
	elseif expand("%:t") =~ "_\\w*\\.php$"
        execute "e " . expand("%:p:h") . "/../actions/components.class.php"
	elseif expand("%:t") =~ "components\\.class\\.php$"
        execute "normal mw"
        execute "?n execute"
        let line = "_" . substitute(getline("."), ".*n execute\\(\\w*\\).*", "\\l\\1", "") . ".phtml"
        execute "normal 'w"
        execute "e " . expand("%:p:h") . "/../templates/" . line
    endif
endfu
map gi :call SwitchSymfonyController()<ENTER>

