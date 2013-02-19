" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "sura_gui"

hi PmenuSel		ctermfg=White	ctermbg=DarkBlue

hi Comment		guifg=#008000					gui=NONE
hi Normal		guifg=black		guibg=white		gui=NONE
hi Constant		guifg=#dd3333					gui=NONE
hi Special		guifg=#444444					gui=NONE
hi Identifier	guifg=#333377					gui=NONE
hi Statement	guifg=#444444					gui=NONE
hi PreProc		guifg=#444444					gui=NONE
hi Type			guifg=#444444					gui=NONE

hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

