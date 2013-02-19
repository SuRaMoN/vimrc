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
let g:colors_name = "sura_win_cli_dos"

hi PmenuSel		ctermfg=White	ctermbg=DarkBlue
hi Comment		cterm=NONE		ctermfg=green
hi Normal		cterm=NONE		ctermbg=black			ctermfg=gray
hi Constant		cterm=NONE		ctermfg=red
hi Special		cterm=NONE		ctermfg=gray
hi Identifier	cterm=NONE		ctermfg=darkcyan
hi Statement	cterm=NONE		ctermfg=darkgray
hi PreProc		cterm=NONE		ctermfg=darkgreen
hi Type			cterm=NONE		ctermfg=darkgray


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

