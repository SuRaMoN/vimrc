
fu! s:ignore()
	let igdirs = [
		\ '\.git',
		\ '\.hg',
		\ '\.svn',
		\ '_darcs',
		\ '\.bzr',
		\ '\.cdv',
		\ '\~\.dep',
		\ '\~\.dot',
		\ '\~\.nib',
		\ '\~\.plst',
		\ '\.pc',
		\ '_MTN',
		\ 'blib',
		\ 'CVS',
		\ 'RCS',
		\ 'SCCS',
		\ '_sgbak',
		\ 'autom4te\.cache',
		\ 'cover_db',
		\ '_build',
		\ ]
	let igfiles = [
		\ '\~$',
		\ '#.+#$',
		\ '[._].*\.swp$',
		\ 'core\.\d+$',
		\ '\.exe$',
		\ '\.so$',
		\ '\.bak$',
		\ '\.png$',
		\ '\.jpg$',
		\ '\.gif$',
		\ '\.zip$',
		\ '\.rar$',
		\ '\.tar\.gz$',
		\ ]
	retu {
		\ 'dir': '\v[\/]('.join(igdirs, '|').')$',
		\ 'file': '\v'.join(igfiles, '|'),
		\ }
endf

if exists("g:syntax_on")
	let g:ctrlp_custom_ignore = s:ignore()
endif

let g:ctrlp_custom_ignore['dir'] .= '|' . join([
 \  '/home/matthias/public_html/ic.platform/userdata',
 \  '/home/matthias/public_html/ic.platform/doc',
 \  '/home/matthias/public_html/ic.platform/build',
 \  '/home/matthias/public_html/ic.platform/cache',
 \  '/home/matthias/public_html/ic.platform/plugins',
 \  '/home/matthias/public_html/ic.platform/uploads',
 \  '/home/matthias/public_html/ic.platform/vendor',
 \  ], '|')

