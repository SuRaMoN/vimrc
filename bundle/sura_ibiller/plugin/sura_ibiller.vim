

if !exists('g:ctrlp_global_ignore') | let g:ctrlp_global_ignore = {} | endif

if !exists("g:on_rooter_change") | let g:on_rooter_change = [] | endif

call add(g:on_rooter_change, "g:Reload_ibiller()")

fu! g:Reload_ibiller()
	if filereadable(".git/FETCH_HEAD")
		for line in readfile(".git/FETCH_HEAD")
			if line =~ 'Credico/ibiller' || line =~ 'SuRaMoN/ibiller'
				call g:Load_ibiller()
				return
			endif
		endfor
	endif
	call g:Unload_ibiller()
endf

fu! g:Load_ibiller()
	let g:ctrlp_global_ignore['ibiller'] = {
		\ 'dir': '^/vendor\|^/docs\|^/app/cache/\|^/userdata\|^/build',
		\ }
endf

fu! g:Unload_ibiller()
	let g:ctrlp_global_ignore['ibiller'] = {}
endf


