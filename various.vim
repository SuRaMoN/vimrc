
" use dot as part of key word for PHP because it used in service names
autocmd FileType php setlocal iskeyword+=.

" async support for vim-test
let test#strategy = "dispatch"

" Ale for lint/QA tools changes
let g:ale_php_phpcs_standard = 'tests/CodeSniffer/ruleset.xml'
let g:ale_sign_column_always = 1 " always show the error bar on the left
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_php_phpstan_level = 7
let g:ale_php_phpstan_configuration = 'tests/PHPstan/level8.neon --autoload-file=tests/PHPstan/autoload.php --errorFormat icontroller_raw'
let g:airline#extensions#tabline#enabled = 1 " enable ale support in airline status bar

" Dont show bopen buffers in airline
let g:airline#extensions#tabline#enabled = 0

" color scheme
colorscheme solarized " 

" use bash instead of sh
if has("unix")
	set shell=bash
endif

if !has('gui_running')
    unmap <c-z>
endif

if exists("+shellslash")
	set shellslash
endif
