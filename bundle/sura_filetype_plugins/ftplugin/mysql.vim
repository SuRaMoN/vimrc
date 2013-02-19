
let g:mysql_db = input("Database? ")
let g:mysql_user = input("User? ", "root")
let g:mysql_pass = input("Pass? ", "")


exec "map <silent> <F5> gg\"nyG:cope<ENTER>:setlocal modifiable<ENTER>p:%!mysql -u " . g:mysql_user . (g:mysql_pass != "" ? " -p" . g:mysql_pass : "") . " -t " . g:mysql_db . "<ENTER>:setlocal nomodifiable<ENTER>"
exec "map <silent> <F6> \"nyy:cope<ENTER>:setlocal modifiable<ENTER>p:%!mysql -u " . g:mysql_user . (g:mysql_pass != "" ? " -p" . g:mysql_pass : "") . " -t " . g:mysql_db . "<ENTER>:setlocal nomodifiable<ENTER>"


