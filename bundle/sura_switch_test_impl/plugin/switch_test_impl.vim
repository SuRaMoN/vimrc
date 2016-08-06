
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
	if exists("g:in_icontroller") && g:in_icontroller
		call PhpSwitchToImplIcontroller()
		return
	endif

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
	if exists("g:in_icontroller") && g:in_icontroller
		call PhpSwitchToTestIcontroller()
		return
	endif

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

function! PhpSwitchToImplIcontroller()
	let file_name = expand("%:p")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/iController/Platform/Tests/\(.*\)Test\.php', '\1/src/iController/Platform/\2.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/iController/lib/Model/\(.*\)Test\.php', '\1/lib/model/\2.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/Customer/[^/]*/Import\(.*\)Test\.php', '\1/lib/task/import\2Task.class.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/Customer/[^/]*/\(.*\)ImportTest\.php', '\1/lib/task/customers/\L\2\E/\L\2\EImportTask.class.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/Customer/\(.*\)Test\.php', '\1/src/Customer/\2.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/frontend/modules/\(.*\)/.*ActionsTest.php', '\1/apps/frontend/modules/\2/actions/actions.class.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/tests/frontend/modules/\(.*\)/.*ComponentsTest.php', '\1/apps/frontend/modules/\2/actions/components.class.php', "")
	execute ':e ' . file_name
endfunction

function! PhpSwitchToTestIcontroller()
	let file_name = expand("%:p")
	let file_name = substitute(file_name, '\(.\{-}\)/src/iController/Platform/\(.*\)\.php', '\1/tests/iController/Platform/Tests/\2Test.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/lib/model/\(.*\)\.php', '\1/tests/iController/lib/Model/\2Test.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/lib/task/import\(.*\)Task\.class\.php', '\1/tests/Customer/\2/Import\2Test.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/lib/task/customers/\(.\)\(.*\)/\(.\)\(.*\)Task\.class\.php', '\1/tests/Customer/\U\2\E\3/\U\4\E\5Test.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/src/Customer/\(.*\)\.php', '\1/tests/Customer/\2Test.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/apps/frontend/modules/\(.*\)/actions/actions.class.php', '\1/tests/frontend/modules/\2/\u\2ActionsTest.php', "")
	let file_name = substitute(file_name, '\(.\{-}\)/apps/frontend/modules/\(.*\)/actions/components.class.php', '\1/tests/frontend/modules/\2/\u\2ComponentsTest.php', "")
	execute ':e ' . file_name
endfunction

