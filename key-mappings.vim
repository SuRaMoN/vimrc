
" leave visual mode on copy
snoremap <C-C> <C-G>"+y<C-\><C-N>

" gd: Goto Definition (for php classes)
nmap gd <Plug>(composer-find)

" ctrl-l: opens Least recently used files
map <C-L> :CtrlPMRUFiles<CR>

" ctrl-f: opens functions in current file
nnoremap <C-f> :CtrlPFunky<Cr>

" specific mappings for tests
nmap <F6> :w<CR>:TestNearest<CR>
imap <silent> <F6> <ESC><F6>

nmap <F7> :w<CR>:TestFile<CR>
imap <silent> <F7> <ESC><F7>

nmap <F8> :w<CR>:TestLast<CR>
imap <silent> <F8> <ESC><F8>

nmap <F9> :call PhpToggleTestImpl()<CR>
imap <silent> <F9> <ESC><F9>
