
func! E(fil)
	for ae in split(a:fil, " ")
		for a in split(expand(ae), "\n")
			exe "e " . a
		endfor
	endfor
endfunc
command! -complete=file -nargs=+ E :call E("<args>")
 
