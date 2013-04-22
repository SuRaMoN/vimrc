
let s:__dir__=expand("<sfile>:p:h")

fun! PhpAutocompleteCreateFile()
	call system("php " .  shellescape(s:__dir__ . "/../VimAutocompleteFileCreator.php") . " > .vimAutoComplete")
endfun
 
