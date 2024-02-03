
" use dot as part of key word for PHP because it used in service names
autocmd FileType php setlocal iskeyword+=.

" async support for vim-test
let test#strategy = 'dispatch'
let g:test#php#phpunit#executable = './vendor/bin/phpunit'
let g:test#php#codeception#file_pattern = 'xxxxxxxxxxx'

" Ale for lint/QA tools changes
let g:ale_php_psalm_executable = 'vendor/bin/psalm.phar'
let g:ale_php_phpcs_standard = 'tests/CodeSniffer/ruleset.xml'
let g:ale_php_phpcbf_standard = 'tests/CodeSniffer/ruleset.xml'
let g:ale_php_phpcs_executable = '/home/matthias/Projects/PHP/ic.platform/bin/phpcs'
let g:ale_php_phpcs_use_global = 1
let g:ale_php_phpcs_options = '--exclude=Generic.Commenting.Todo,Icontroller.Annotations.BlacklistedAnnotations'
let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
let g:ale_php_phpstan_autoload = 'tests/PHPstan/autoload.php'
let g:ale_php_phpstan_level = '8'
let g:ale_php_phpstan_configuration = 'tests/PHPstan/level9.neon'
let g:ale_python_pylint_change_directory = 0
let g:ale_fixers = { 'php': ['phpcbf'] }

let g:ale_sign_column_always = 1 " always show the error bar on the left
let g:ale_lint_delay = 1000

let g:ale_linters_explicit = 1
" , 'langserver'
let g:ale_pattern_options = {
\   '^/home/matthias/Projects/PHP/ic.platform': {'ale_linters': ['phpstan', 'phpcs', 'yamllint', 'shell', 'php']},
\   '^/home/matthias/Projects/PHP/authi': {'ale_linters': ['phpstan', 'yamllint', 'shell', 'php'], 'ale_php_phpstan_configuration': '', 'ale_php_phpstan_autoload': ''},
\   '.*/lib/model/om/Base.*\.php': {'ale_enabled': 0},
\   '.*/vendor/.*': {'ale_enabled': 0},
\   '^/home/matthias/Projects/Python/zexport-client': {'ale_linters': ['pylint', 'mypy']},
\   '^/home/matthias/Projects/Python/zexport-admin': {'ale_linters': ['pylint', 'mypy']},
\   '^/home/matthias/Projects/Python/icontroller-machine-learning': {'ale_linters': ['pylint']},
\}


let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

let g:PhpactorRootDirectoryStrategy = {-> getcwd() }

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

noremenu PopUp.PhpActor :PhpactorContextMenu<cr>

function! s:open_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0]
  if l:branch ==? '*'
    let l:branch = l:parser[1]
  endif
  execute '!git checkout ' . l:branch
endfunction

command! -bang -nargs=0 GCheckout
  \ call fzf#vim#grep(
  \   'git branch -v --sort=-committerdate', 0,
  \   {
  \     'sink': function('s:open_branch_fzf')
  \   },
  \   <bang>0
  \ )

" vimrooter
let g:rooter_patterns = [".vimrooter"]

" enable ale support in airline status bar
let g:airline#extensions#tabline#enabled = 1

" Dont show bopen buffers in airline
let g:airline#extensions#tabline#enabled = 0

" Testing if this speeds up vim after extensive usage
let g:airline_highlighting_cache = 1

" Dont index userdata, uploads and vendor for CtrlP
"let g:ctrlp_custom_ignore = '\(ic.platform\|icontroller\)/\(vendor\|userdata\|uploads\)'

" phtml uses php syntax
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.phtml set filetype=php
augroup END

" neon uses yaml syntax
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.neon set filetype=yaml
augroup END

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.neon.dist set filetype=yaml
augroup END


" color scheme
colorscheme solarized

function! CtagsLoad()
    exec ':Dispatch! ' .
        \ 'ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cint-favd --exclude=composer.phar -f tags.new lib src apps config tests; rm -f tags; mv tags.new tags;' .
        \ 'ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cint-favd --exclude=composer.phar --exclude=phpstan --exclude=phpstan.phar -f tags.vendors.new vendor; rm -f tags.vendors; mv tags.vendors.new tags.vendors;' .
        \ 'ctags --tag-relative=yes -R --fields=+aimlS --languages=php --PHP-kinds=+cint-favd --exclude=composer.phar -f tags.spl /home/matthias/.config/composer/vendor/jetbrains/phpstorm-stubs/'
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
