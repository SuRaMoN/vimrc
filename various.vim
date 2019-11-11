
" use dot as part of key word for PHP because it used in service names
autocmd FileType php setlocal iskeyword+=.

" async support for vim-test
let test#strategy = 'dispatch'

" Ale for lint/QA tools changes
let g:ale_php_phpcs_standard = 'tests/CodeSniffer/ruleset.xml'
let g:ale_php_phpcbf_standard = 'tests/CodeSniffer/ruleset.xml'
let g:ale_php_phpcs_executable = '/home/matthias/Projects/PHP/ic.platform/bin/phpcs'
let g:ale_php_phpcs_use_global = 1
let g:ale_php_phpcs_options = '--exclude=Generic.Commenting.Todo,Icontroller.Annotations.BlacklistedAnnotations'
let g:ale_php_phpstan_executable = 'bin/phpstan-vim'
let g:ale_php_phpstan_level = 7
let g:ale_php_phpstan_configuration = 'tests/PHPstan/level8.neon'
let g:ale_php_phpstan_autoload = 'tests/PHPstan/autoload.php'
let g:ale_python_pylint_change_directory = 0
let g:ale_fixers = { 'php': ['phpcbf'] }
"let g:ale_php_langserver_use_global = 1
"let g:ale_php_langserver_executable = expand('~/.config/composer/vendor/felixfbecker/language-server/bin/php-language-server.php')
"let g:ale_completion_enabled = 0

let g:ale_sign_column_always = 1 " always show the error bar on the left
let g:ale_lint_delay = 1000

let g:ale_linters_explicit = 1
" , 'langserver'
let g:ale_pattern_options = {
\   '^/home/matthias/Projects/PHP/ic.platform': {'ale_linters': ['phpstan', 'phpcs', 'yamllint', 'shell']},
\   '.*/lib/model/om/Base.*\.php': {'ale_enabled': 0},
\   '.*/vendor/.*': {'ale_enabled': 0},
\}

" goto definition
nmap <C-LeftMouse> <LeftMouse><Plug>(coc-definition)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" yank list for fzf
function! s:yank_list()
  redir => ys
  silent Yanks
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:yank_handler(reg)
  let @+=substitute(a:reg, "[0-9]* *", "", "")
endfunction

command! FZFYank call fzf#run({
\ 'source': <sid>yank_list(),
\ 'sink': function('<sid>yank_handler'),
\ 'options': '-m',
\ 'down': 12
\ })

" enable ale support in airline status bar
let g:airline#extensions#tabline#enabled = 1

" Dont show bopen buffers in airline
let g:airline#extensions#tabline#enabled = 0

" Testing if this speeds up vim after extensive usage
let g:airline_highlighting_cache = 1

" Dont index userdata, uploads and vendor for CtrlP
"let g:ctrlp_custom_ignore = '\(ic.platform\|icontroller\)/\(vendor\|userdata\|uploads\)'

" Auto import namespaces in vim
let g:php_namespace_sort_after_insert = 1
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>


" phtml uses php syntax
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.phtml set filetype=php
augroup END

" color scheme
colorscheme solarized

function! CtagsLoad()
    exec ':Dispatch! ' .
        \ 'ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cfint-avd --exclude=composer.phar -f tags.new lib src apps config tests; rm -f tags; mv tags.new tags;' .
        \ 'ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cfint-avd --exclude=composer.phar -f tags.vendors.new vendor; rm -f tags.vendors; mv tags.vendors.new tags.vendors;' .
        \ 'ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cfint-avd --exclude=composer.phar -f tags.spl /home/matthias/.config/composer/vendor/jetbrains/phpstorm-stubs/'
endfunction
command! CtagsLoad call CtagsLoad()

" silver search is faster then ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" use bash instead of sh
if has('unix')
    set shell=bash
endif

if !has('gui_running')
    unmap <c-z>
endif

if exists('+shellslash')
    set shellslash
endif
