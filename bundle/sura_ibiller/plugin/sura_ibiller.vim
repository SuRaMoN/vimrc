

if !exists('g:ctrlp_global_ignore') | let g:ctrlp_global_ignore = {} | endif

if !exists("g:on_rooter_change") | let g:on_rooter_change = [] | endif

call add(g:on_rooter_change, "g:reload_ibiller()")

fu! g:reload_ibiller()
	if filereadable(".git/FETCH_HEAD")
		for line in readfile(".git/FETCH_HEAD")
			if line =~ 'Credico/ibiller' || line =~ 'SuRaMoN/ibiller'
				call g:load_ibiller()
				return
			endif
		endfor
	endif
	call g:unload_ibiller()
endf

fu! g:load_ibiller()
	let g:ctrlp_global_ignore['ibiller'] = {
		\ 'dir': '^/vendor\|^/docs\|^/app/cache/\|^/userdata\|^/build',
		\ }
endf

fu! g:unload_ibiller()
	let g:ctrlp_global_ignore['ibiller'] = {}
endf


