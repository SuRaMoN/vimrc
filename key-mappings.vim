
" gd: Goto Definition (for php classes)
nmap gd <Plug>(composer-find)

" ctrl-l: opens Least recently used files
map <C-L> :CtrlPMRUFiles<CR>

" specific mappings for tests
nmap <F6> :TestNearest<CR>
nmap <F7> :TestFile<CR>
nmap <F8> :TestLast<CR>
nmap <F9> :call PhpToggleTestImpl()<CR>
