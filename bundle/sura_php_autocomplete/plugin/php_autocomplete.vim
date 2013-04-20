
let s:__dir__=expand("<sfile>:p:h")

fun! PhpAutocompleteCreateFile()
	call system("find -name '*.php' | xargs -P 2 -n 1 php " .  shellescape(s:__dir__ . "/../PHPParser.php") . " > .vimAutoComplete")
endfun
 
