
function! GetMatchingClass(class)
	let classes = readfile("./classes")
	let i = match(classes, "\\( \\|\\\\\\)" . escape(a:class, "\\^$.*~[]") . ";")
	if i == -1
		return ""
	else
		return classes[i]
	endif
endfunction

function! ResolveNamespaces()
	let class = expand("<cword>")
	execute "normal gg/\\v(use|class)\\s\<ENTER>ko\<ESC>"
	call setline(".", GetMatchingClass(class))
	let @/ = ""
endfunction
 
command! ResolveNamespaces call ResolveNamespaces()

