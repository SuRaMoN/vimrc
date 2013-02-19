
if exists("current_compiler")
  finish
endif
let current_compiler = "phpunit"

let s:cpo_save = &cpo
set cpo-=C

setlocal makeprg=./phpunit.sh\ %:p

setlocal errorformat=PHP\ Fatal\ error:\ %m\ in\ %f\ on\ line\ %l,PHP%*\\s%*\\d.\ %m\ %f:%l,%f:%l

let &cpo = s:cpo_save
unlet s:cpo_save

