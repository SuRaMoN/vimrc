
map <silent> <F5> :w !python<ENTER>

imap <silent> <F5> <ESC><F5>

syntax on
filetype plugin on
filetype detect
set smartindent
set expandtab
set syntax=python


let ropevim_local_prefix = "<C-e>r"
let ropevim_global_prefix = "<C-r>p"

function! LoadRope()
python << EOF
import ropevim
EOF
endfunction

call LoadRope()

let ropevim_vim_completion=1
let ropevim_extended_complete=1




