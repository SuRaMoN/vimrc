
map <silent> <F5> :call Make() \| cw<ENTER>
map <silent> <F6> :call Exec("make exec", 1, 0)<ENTER>

imap <silent> <F5> <ESC><F5>
imap <silent> <F6> <ESC><F6>

syntax on
filetype plugin on
filetype detect

set foldexpr=getline(v:lnum)!~'\\\\\\(sub\\)*section'
set foldmethod=expr
set nofoldenable

if has("unix")
	set dictionary+=$HOME/.vim/dictionaries/latex
else
	set dictionary+=$HOME/vimfiles/dictionaries/latex
endif


set textwidth=75
set formatoptions+=t

