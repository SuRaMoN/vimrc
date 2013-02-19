 

func! SwitchSourceHeader()
	if expand("%:t") =~ "\\.c\\(pp\\)\\{0,1}$"
		find %:t:r.h*
	elseif expand("%:t") =~ "\\.h\\(pp\\)\\{0,1}$"
		find %:t:r.c*
	endif
endfunc
map ,s :call SwitchSourceHeader()<ENTER>


