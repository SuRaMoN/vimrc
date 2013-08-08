
function! RunAllPhpTests()
	ccl
	AsyncMake
endfunction 

function! RunCurrentFileTests()
	let s:lastTestedFile = expand("%")
	ccl
	execute ":AsyncMake " . expand("%")
endfunction 

function! RunLastFileTests()
	ccl
	execute ":AsyncMake " . s:lastTestedFile
endfunction 

