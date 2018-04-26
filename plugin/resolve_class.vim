
function! GetClassesFromFile()
    if filereadable("./classes")
        return readfile("./classes")
    else
        return []
    endif
endfunction

function! GetClassesFromOpenBuffers()
    let classes = []
    for i in range(1, bufnr("$"))
        if ! bufexists(i) || ! bufloaded(i)
            continue
        endif
        let buf_contents = join(getbufline(i, 1, "$"), "\n")
        let matchpart = matchstr(buf_contents, 'namespace\s*\([^;]*\).*\(class\|interface\)\s*\([_a-zA-Z]*\)')
        if matchpart == ""
            continue
        endif
        let full_classname = substitute(matchpart, 'namespace\s*\([^;]*\).*\(class\|interface\)\s*\([_a-zA-Z]*\)', '\1\\\3', "")
        if full_classname == buf_contents
            continue
        endif
        call add(classes, "use " . full_classname . ";")
    endfor
    return classes
endfunction

function! GetMatchingClass(class)
    let classes = []
    call extend(classes, GetClassesFromFile())
    call extend(classes, GetClassesFromOpenBuffers())
    let i = match(classes, "\\( \\|\\\\\\)" . escape(a:class, "\\^$.*~[]") . ";")
    if i == -1
        return ""
    else
        return classes[i]
    endif
endfunction

function! ResolveNamespaces()
    let class = expand("<cword>")
    execute "normal ggj/\\v(namespace)\\s\<ENTER>jo\<ESC>"
    call setline(".", GetMatchingClass(class))
    execute "normal gg/^use \<ENTER>k"
    execute "/^use /,/^\\(\\(^use \\)\@!.\\)*$/-1!sort -u"
    let @/ = ""
endfunction
 
command! ResolveNamespaces call ResolveNamespaces()

