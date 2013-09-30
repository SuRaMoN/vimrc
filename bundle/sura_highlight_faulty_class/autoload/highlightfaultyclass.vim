
fun! highlightfaultyclass#HighlightFaultyClasses()
	if !exists("b:current_syntax") || b:current_syntax != "php"
		return
	endif

	syn clear FaultyClass

	for faultyClass in s:FindFaultyClasses()
		exec "syn keyword FaultyClass " . faultyClass
	endfor
endfunc

fun! s:FindFaultyClasses()
	let languageConstructs = ['parent', 'self', 'static']
	let faultyClasses = []
	for notInUseClass in s:FindClassesNotInUseDefinition()
		if index(languageConstructs, notInUseClass) == -1 && strpart(notInUseClass, 0, 1) != '\'
			call add(faultyClasses, notInUseClass)
		endif
	endfor
	return faultyClasses
endfun

fun! s:FindClassesNotInUseDefinition()
	let classesNotInUseDefinition = []
	let source = join(getline(1, '$'), "\n")
	let definedUseClasses = s:GetClassesInUseDefinitionSet(source)
	for classUsage in s:FindClassUsages(source)
		if !has_key(definedUseClasses, classUsage)
			call add(classesNotInUseDefinition, classUsage)
		endif
	endfor
	return classesNotInUseDefinition
endfun

fun! s:MatchAll(haystack, needle)
	let results = []
	let i = 1
	while 1
		let result = matchstr(a:haystack, a:needle, 0, i)
		let i += 1
		if result == ""
			break
		endif
		call add(results, result)
	endwhile
	return results
endfun

fun! s:MatchAllAround(haystack, needle, indicator)
	let results = []
	let i = -1
	let maxSearches = 20
	while 1
		let maxSearches -= 1
		if maxSearches == 0
			return results
		endif
		let i = stridx(a:haystack, a:indicator, i + 1)
		if -1 == i
			break
		endif
		let nextNewlineIndex = stridx(a:haystack, "\n", i)
		if nextNewlineIndex == -1
			let nextNewlineIndex = strlen(a:haystack)
		endif
		let previousNewlineIndex = strridx(a:haystack, "\n", i)
		if previousNewlineIndex == -1
			let previousNewlineIndex = 0
		endif
		let context = strpart(a:haystack, previousNewlineIndex, nextNewlineIndex - previousNewlineIndex)
		call extend(results, s:MatchAll(context, a:needle))
	endwhile
	return results
endfun

fun! s:FindUseDefinitions(source)
	return s:MatchAllAround(a:source, '\v(\s*use\s+)@<=(\w|\\|_)+', 'use')
endfun

fun! s:GetClassesInUseDefinitionSet(source)
	let useSet = {}
	for useDefinition in s:FindUseDefinitions(a:source)
		let useSet[substitute(useDefinition, '.*\\', '', '')] = 1
	endfor
	return useSet
endfun

fun! s:FindClassUsages(source)
	let classList = []
	call extend(classList, s:MatchAllAround(a:source, '\v(new\s+)@<=(\w|\\|_)+', 'new'))
	call extend(classList, s:MatchAllAround(a:source, '\v(instanceof\s+)@<=(\w|\\|_)+', 'instanceof'))
	call extend(classList, s:MatchAllAround(a:source, '\v(\s|^|\(|;)@<=(\w|\\|_)+(::)@=', '::'))
	return classList
endfun

