


if !exists('g:ctrlp_global_ignore') | let g:ctrlp_global_ignore = {} | endif

if !exists("g:on_rooter_change") | let g:on_rooter_change = [] | endif

call add(g:on_rooter_change, "g:reload_icontroller()")

fu! g:reload_icontroller()
	if filereadable(".git/FETCH_HEAD")
		for line in readfile(".git/FETCH_HEAD")
			if line =~ 'Credico/ic.platform' || line =~ 'SuRaMoN/ic.platform'
				call g:load_icontroller()
				return
			endif
		endfor
	endif
	call g:unload_icontroller()
endf

fu! g:load_icontroller()
	let g:ctrlp_global_ignore['icontroller'] = {
		\ 'dir': '^/userdata\|^/doc\|^/build\|^/cache\|^/plugins\|^/uploads\|^/vendor',
		\ }
endf

fu! g:unload_icontroller()
	let g:ctrlp_global_ignore['icontroller'] = {}
endf


