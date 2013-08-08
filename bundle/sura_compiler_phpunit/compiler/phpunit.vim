
let s:current_file=expand("<sfile>:p:h")

if exists("current_compiler")
"  finish
endif
let current_compiler = "phpunit"

let s:cpo_save = &cpo
set cpo-=C

let &l:makeprg=s:current_file . "/../phpunit.sh"

setlocal errorformat=PHP\ Fatal\ error:\ %m\ in\ %f\ on\ line\ %l,PHP%*\\s%*\\d.\ %m\ %f:%l,%f:%l

let &cpo = s:cpo_save
unlet s:cpo_save

