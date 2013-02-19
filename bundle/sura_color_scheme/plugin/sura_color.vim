
try
	if has("gui_running") || (has("unix") && &term == "cygwin")
		colo sura_gui
	endif
	if (!has("gui_running") && !has("unix")) || &term == "cygwin"
		colo sura_win_cli_dos
	endif
catch
endtry 

