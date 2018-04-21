 

func! SwitchSourceHeader()
	if expand("%:t") =~ "\\.c\\(pp\\)\\{0,1}$"
		find %:p:r.h*
	elseif expand("%:t") =~ "\\.h\\(pp\\)\\{0,1}$"
		find %:p:r.c*
	endif
endfunc
map ,s :call SwitchSourceHeader()<ENTER>


