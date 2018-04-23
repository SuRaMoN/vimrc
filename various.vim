
" use dot as part of key word for PHP because it used in service names
autocmd FileType php setlocal iskeyword+=.

" async support for vim-test
let test#strategy = "dispatch"

" support for our ruleset
let g:ale_php_phpcs_standard = 'tests/CodeSniffer/ruleset.xml'

" color scheme
colorscheme solarized " 

" use bash instead of sh
if has("unix")
	set shell=bash
endif

if exists("+shellslash")
	set shellslash
endif
