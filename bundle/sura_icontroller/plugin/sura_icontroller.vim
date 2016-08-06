
if !exists('g:ctrlp_global_ignore') | let g:ctrlp_global_ignore = {} | endif

if !exists("g:on_rooter_change") | let g:on_rooter_change = [] | endif

call add(g:on_rooter_change, "g:Reload_icontroller()")

let g:in_icontroller = 0

fu! g:Reload_icontroller()
	if filereadable(".git/FETCH_HEAD")
		for line in readfile(".git/FETCH_HEAD")
			if line =~ 'Credico/ic.platform' || line =~ 'SuRaMoN/ic.platform'
				call g:Load_icontroller()
				return
			endif
		endfor
	endif
	call g:Unload_icontroller()
endf

fu! g:Load_icontroller()
	let g:in_icontroller = 1
	let g:ctrlp_global_ignore['icontroller'] = {
		\ 'dir': '^/userdata\|^/doc\|^/build\|^/cache\|^/plugins\|^/uploads\|^/vendor',
		\ }
endf

fu! g:Unload_icontroller()
	let g:in_icontroller = 0
	let g:ctrlp_global_ignore['icontroller'] = {}
endf

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
        let line = substitute(getline("."), ".*n execute\\(\\w*\\).*", "\\l\\1", "") . "Success.php"
        execute "normal 'w"
        execute "e " . expand("%:p:h") . "/../templates/" . line
	elseif expand("%:t") =~ "Success\\.php$"
        execute "e " . expand("%:p:h") . "/../actions/actions.class.php"
	elseif expand("%:t") =~ "_\\w*\\.php$"
        execute "e " . expand("%:p:h") . "/../actions/components.class.php"
	elseif expand("%:t") =~ "components\\.class\\.php$"
        execute "normal mw"
        execute "?n execute"
        let line = "_" . substitute(getline("."), ".*n execute\\(\\w*\\).*", "\\l\\1", "") . ".php"
        execute "normal 'w"
        execute "e " . expand("%:p:h") . "/../templates/" . line
    endif
endfu
map gi :call SwitchSymfonyController()<ENTER>

