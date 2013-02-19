
func! FatalErr()
	for e in getqflist()
		if e.valid != 0
			return 1
		endif
	endfor
	return 0
endfunc

func! Make()
	let t = &autowrite
	set autowrite
	silent make!
	let &autowrite = t
endfunc

func! Exec(command, pause, onlyOnSucc)
	if a:onlyOnSucc && FatalErr()
		return
	endif
	if has("unix")
		let cmd_path = 'gnome-terminal -x bash -c'
		let pause_comm = "read -p pause"
	else
		let cmd_path = 'start cmd /c'
		let pause_comm = "pause"
	endif
	if a:pause
		exe 'silent !' . cmd_path . ' "' . a:command . ' || ' . pause_comm . '"'
	else
		exe 'silent !' . cmd_path . ' "' . a:command . '"'
	endif
endfunc
 
