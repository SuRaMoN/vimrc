
" leave visual mode on copy
snoremap <C-C> <C-G>"+y<C-\><C-N>

" ctrl-l: opens Least recently used files
map <C-UP> :History<CR>
imap <C-UP> <ESC>:History<CR>
map <C-L> :History<CR>
map <C-P> :FZF<CR>
smap <C-P> <ESC>:execute "FZF -q " @*<CR>
map <C-Y> :FZFYank<CR>

" overwrite crl-click with ALE
"nnoremap <C-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>

" specific mappings for tests
nmap <F6> :w<CR>:TestNearest<CR>
imap <silent> <F6> <ESC><F6>

nmap <F7> :w<CR>:TestFile<CR>
imap <silent> <F7> <ESC><F7>

nmap <F8> :w<CR>:TestLast<CR>
imap <silent> <F8> <ESC><F8>

nmap <F9> :call PhpToggleTestImpl()<CR>
imap <silent> <F9> <ESC><F9>

" ALE errors next and previous
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

map <C-E> :cnext<CR>

" cp copies current file to clipboard
nmap cp :let @+ = expand("%")<cr>

" Auto import namespaces in vim
autocmd FileType php inoremap <Leader>u <Esc>:PhpactorImportClass<CR>
autocmd FileType php noremap <Leader>u :PhpactorImportClass<CR>
autocmd FileType php inoremap <Leader>a <Esc>:PhpactorImportMissingClasses<CR>
autocmd FileType php noremap <Leader>a :PhpactorImportMissingClasses<CR>

autocmd FileType php inoremap <C-LeftMouse> <Esc><LeftMouse>:PhpactorGotoDefinition<CR>
autocmd FileType php noremap <C-LeftMouse> <LeftMouse>:PhpactorGotoDefinition<CR>
