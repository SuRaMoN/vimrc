
function! PhpToggleTestImpl()
	let file_name = expand("%:t")
	let extension = expand("%:e")
	let name_no_ext = strpart(file_name, 0, strlen(file_name) - strlen(extension) - 1)
	if match(name_no_ext, "[Tt]est$") == -1
		call PhpSwitchToTest()
	else
		call PhpSwitchToImpl()
	endif
endfunction 

function! PhpSwitchToImpl()
	let file_name = expand("%:t")
	let extension = expand("%:e")
	let impl_name = substitute(file_name, "Test\." . extension, "." . extension, "")
	let crumbs = split(expand("%:p:h"), "[\\|/]")
	while len(crumbs) > 0
		let last_crumb = remove(crumbs, -1)
		let impl_name = last_crumb . '/' . impl_name
		let impl_dir_location = "/" . join(crumbs, "/")
		if match(last_crumb, "^[Tt]ests\\{0,1}$") == -1
			continue
		endif
		let impl_name = substitute(impl_name, "[^/]*/", "", "")
		if isdirectory(impl_dir_location . '/src')
			let impl_dir_location = impl_dir_location . '/src'
		endif
		if isdirectory(impl_dir_location . '/lib')
			let impl_dir_location = impl_dir_location . '/lib'
		endif
		execute ':e ' .  impl_dir_location . '/' . impl_name
		break
	endwhile
endfunction

function! PhpSwitchToTest()
	let file_name = expand("%:t")
	let extension = expand("%:e")
	let test_name = substitute(file_name, "\." . extension, "Test." . extension, "")
	let crumbs = split(expand("%:p:h"), "[\\|/]")
	while len(crumbs) > 0
		let last_crumb = remove(crumbs, -1)
		let test_name = last_crumb . '/' . test_name
		let test_dir_location = "/" . join(crumbs, "/")
		if isdirectory(test_dir_location . '/tests')
			let test_dir = test_dir_location . '/tests'
		elseif isdirectory(test_dir_location . '/Tests')
			let test_dir = test_dir_location . '/Tests'
		elseif isdirectory(test_dir_location . '/test')
			let test_dir = test_dir_location . '/test'
		elseif isdirectory(test_dir_location . '/Test')
			let test_dir = test_dir_location . '/Test'
		else
			continue
		endif
		if last_crumb == 'src' || last_crumb == 'lib'
			let test_name = substitute(test_name, "[^/]*/", "", "")
		endif
		let test_name = test_dir . '/' . test_name
		execute ':e ' . test_name
	endwhile
endfunction 

