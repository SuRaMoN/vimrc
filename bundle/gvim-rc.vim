 
if has("unix")
	let s:tml_path = $HOME . "/.vim/template/"
else
	let s:tml_path = $HOME . "/vimfiles/template/"
endif
if filereadable(s:tml_path . "template.lst")
	let i = 0
	for l in readfile(s:tml_path . "template.lst")
		let a = split(l, "\t")
		let i += 1
		exe "an <silent> 8400." . i . " Create\\ template." . escape(a[0], ". ") . " :silent call writefile(readfile('" . s:tml_path . a[2] . "'), '" . a[1] . "')<ENTER>"
	endfor
endif

nmenu <silent> 8600.10.10 SuRactions.Escape/replace.Escape\ pcre\ metachars :%s=\\=\\\\=ge \| %s=\.\\|\^\\|\$\\|\*\\|+\\|?\\|{\\|\[\\|\]\\|\|\\|(\\|)=\\\0=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.10 SuRactions.Escape/replace.Escape\ pcre\ metachars :s=\\=\\\\=ge \| '<,'>s=\.\\|\^\\|\$\\|\*\\|+\\|?\\|{\\|\[\\|\]\\|\|\\|(\\|)=\\\0=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.20 SuRactions.Escape/replace.Escape\ / :%s=/=\\/=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.20 SuRactions.Escape/replace.Escape\ / :s=/=\\/=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.30 SuRactions.Escape/replace.Escape\ vim\ re\ metachars :%s=\\=\\\\=ge \| %s=\.\\|\^\\|\$\\|\*\\|\[\\|\]=\\\0=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.30 SuRactions.Escape/replace.Escape\ vim\ re\ metachars :s=\\=\\\\=ge \| '<,'>s=\.\\|\^\\|\$\\|\*\\|\[\\|\]=\\\0=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.40 SuRactions.Escape/replace.Escape\ php\ "string" :%s=\\=\\\\=ge \| %s=\$\\|"=\\\0=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.40 SuRactions.Escape/replace.Escape\ php\ "string" :s=\\=\\\\=ge \| '<,'>s=\$\\|"=\\\0=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.45 SuRactions.Escape/replace.Escape\ C++\ "string" :%s=\\=\\\\=ge \| %s="=\\\0=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.45 SuRactions.Escape/replace.Escape\ C++\ "string" :s=\\=\\\\=ge \| '<,'>s="=\\\0=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.50 SuRactions.Escape/replace.Escape\ php\ 'string' :%s=\\=\\\\=ge \| %s='=\\\0=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.50 SuRactions.Escape/replace.Escape\ php\ 'string' :s=\\=\\\\=ge \| '<,'>s='=\\\0=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.55 SuRactions.Escape/replace.Escape\ url :%s/[^a-zA-Z0-9]/\="%".printf("%02x", char2nr(submatch(0)))/ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.55 SuRactions.Escape/replace.Escape\ url :s/[^a-zA-Z0-9]/\="%".printf("%02x", char2nr(submatch(0)))/ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.60 SuRactions.Escape/replace.NL\ ->\ \\n :%s=\r\?\n=\\n=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.60 SuRactions.Escape/replace.NL\ ->\ \\n :s=\r\?\n=\\n=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.70 SuRactions.Escape/replace.NL\ ->\ \\r\\n :%s=\r\?\n=\\r\\n=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.70 SuRactions.Escape/replace.NL\ ->\ \\r\\n :s=\r\?\n=\\r\\n=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.80 SuRactions.Escape/replace.\\n\ ->\ NL :%s=\\n=\r=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.80 SuRactions.Escape/replace.\\n\ ->\ NL :s=\\n=\r=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.90 SuRactions.Escape/replace.Encode\ html\ spacial\ chars :%s=&=\&amp;=ge \| %s="=\&quot;=ge \| %s=<=\&lt;=ge \| %s=>=\&gt;=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.90 SuRactions.Escape/replace.Encode\ html\ spacial\ chars :s=&=\&amp;=ge \| '<,'>s="=\&quot;=ge \| '<,'>s=<=\&lt;=ge \| '<,'>s=>=\&gt;=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.100 SuRactions.Escape/replace.Decode\ html\ spacial\ chars :%s=&quot;="=ge \| %s=&lt;=<=ge \| %s=&gt;=>=ge \| %s=&amp;=\&=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.100 SuRactions.Escape/replace.Decode\ html\ spacial\ chars :s=&quot;="=ge \| '<,'>s=&lt;=<=ge \| '<,'>s=&gt;=>=ge \| '<,'>s=&amp;=\&=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.110 SuRactions.Escape/replace.Unescape :%s=\\\(.\)=\1=ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.110 SuRactions.Escape/replace.Unescape :s=\\\(.\)=\1=ge \| let @/ = ""<CR>
nmenu <silent> 8600.10.120 SuRactions.Escape/replace.Unescape\ url :%s/%\([0-9a-fA-F]\{1,2}\)/\=nr2char("0x".submatch(1)+0)/ge \| let @/ = ""<CR>
vmenu <silent> 8600.10.120 SuRactions.Escape/replace.Unescape\ url :s/%\([0-9a-fA-F]\{1,2}\)/\=nr2char("0x".submatch(1)+0)/ge \| let @/ = ""<CR>


let ar_enc = ["ansi", "latin1", "japan", "chinese", "utf8", "unicode", "ucs-2", "ucs-4"]
let i = 0

for enco in ar_enc
	let i += 1
	exe "an 8600.15.10." . i . "0 SuRactions.Encoding.Reopen\\ file\\ with\\ encoding.&" . enco . " :e ++enc=" . enco . "<CR>"
	exe "an 8600.15.20." . i . "0 SuRactions.Encoding.Convert\\ to\\ encoding." . enco . " :set fileencoding=" . enco . "<CR>"
	exe "an 8600.15.30." . i . "0 SuRactions.Encoding.Set\\ terminal\\ encoding\\ to." . enco . " :set encoding=" . enco . "<CR>"
endfor

an <silent> 8600.15.40.10 SuRactions.Encoding.Set\ fileencodings\ to.ucs-bom :set fileencodings=ucs-bom<CR>
an <silent> 8600.15.40.20 SuRactions.Encoding.Set\ fileencodings\ to.latin1 :set fileencodings=latin1<CR>
an <silent> 8600.15.50.10 SuRactions.Encoding.Iconv.latin1\ ->\ utf-8 :%!iconv -f latin1 -t utf-8<CR>
an <silent> 8600.15.50.20 SuRactions.Encoding.Iconv.latin1\ ->\ utf-16 :%!iconv -f latin1 -t utf-16<CR>
an <silent> 8600.15.50.30 SuRactions.Encoding.Iconv.utf-8\ ->\ latin1 :%!iconv -f utf-8 -t latin1<CR>
an <silent> 8600.15.50.40 SuRactions.Encoding.Iconv.utf-16\ ->\ latin1 :%!iconv -f utf-16 -t latin1<CR>
an <silent> 8600.15.60 SuRactions.Encoding.Reopen\ file :e<CR>
an <silent> 8600.15.70 SuRactions.Encoding.Get\ current\ encoding :set fileencoding<CR>


an 8600.17.10.10.10 SuRactions.Idioms.C/C++.C++\ libraries.wxWidgets /^LDFLAGS \?=<ENTER>$a $(shell wx-config --static=no --libs)/^CPPFLAGS \?=<ENTER>$a -fno-rtti $(shell wx-config --cppflags):let @/ = ""<ENTER>
an 8600.17.10.10.20 SuRactions.Idioms.C/C++.C++\ libraries.boost\ C++ /^CPPFLAGS \?=<ENTER>$a $(shell boost-config.sh --cppflags):let @/ = ""<ENTER>
an 8600.17.10.20 SuRactions.Idioms.C/C++.Header\ file\ macro ggO#ifndef =toupper(substitute(expand("%:t"), "[^a-zA-Z0-9_]", "_", "g"))#define =toupper(substitute(expand("%:t"), "[^a-zA-Z0-9_]", "_", "g"))Go#endif

an 8600.17.20.005 SuRactions.Idioms.HTML.XHTML\ Strict\ template ggi<?xml version="1.0" encoding="utf-8"?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html><head><title></title></head><body></body></html>j
an 8600.17.20.005 SuRactions.Idioms.HTML.HTML5\ template ggi<!DOCTYPE html><html><head><title></title></head><body></body></html>j
an 8600.17.20.010 SuRactions.Idioms.HTML.<?xml\ version ggO<?xml version="1.0" encoding="utf-8"?>j
an 8600.17.20.020 SuRactions.Idioms.HTML.Doctype\ XHTML\ strict 2GO<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">j
an 8600.17.20.030 SuRactions.Idioms.HTML.Doctype\ XHTML\ transitional 2GO<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">j
an 8600.17.20.040 SuRactions.Idioms.HTML.<html O<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">j
an 8600.17.20.045 SuRactions.Idioms.HTML.</html o</html>
an 8600.17.20.050 SuRactions.Idioms.HTML.<head><body> O<head></head><body></body>j
an 8600.17.20.060 SuRactions.Idioms.HTML.<style\ src O<link href="" rel="stylesheet" type="text/css" />j
an 8600.17.20.060 SuRactions.Idioms.HTML.<style\ inline O<style type="text/css"></style>j
an 8600.17.20.070 SuRactions.Idioms.HTML.<script\ src O<script src="" type="text/javascript"></script>j
an 8600.17.20.080 SuRactions.Idioms.HTML.<script\ inline O<script type="text/javascript"><!--// --></script>j
an 8600.17.20.090 SuRactions.Idioms.HTML.<input\ text O<input type="text" name="" value="" />j
an 8600.17.20.100 SuRactions.Idioms.HTML.<input\ radio O<input type="radio" name="" value="" />j
an 8600.17.20.110 SuRactions.Idioms.HTML.<input\ checkbox O<input type="checkbox" name="" value="" />j
an 8600.17.20.120 SuRactions.Idioms.HTML.<textarea O<textarea name=""></textarea>j
an 8600.17.20.130 SuRactions.Idioms.HTML.<select O<select name=""><option name=""></option></select>j

an 8600.17.30.01 SuRactions.Idioms.PHP.W3C\ XHTML\ validator :silent !start firefox -new-tab "http://validator.w3.org/"<ENTER>
an 8600.17.30.02 SuRactions.Idioms.PHP.W3C\ CSS\ validator :silent !start firefox -new-tab "http://jigsaw.w3.org/css-validator/"<ENTER>
an 8600.17.30.03 SuRactions.Idioms.PHP.Start\ EasyPHP :silent !start C:\Program Files\EasyPHP 2.0b1\EasyPHP.exe<ENTER>
an 8600.17.30.04 SuRactions.Idioms.PHP.Open\ localhost :silent !start firefox -new-tab "127.0.0.1"<ENTER>
an 8600.17.30.05 SuRactions.Idioms.PHP.Open\ www-folder :silent !start explorer "D:\backup_pc\internet\Programming\www"<ENTER>
an 8600.17.30.06 SuRactions.Idioms.PHP.Open\ profiler-folder :silent !start explorer "C:\Program Files\EasyPHP 2.0b1\profiles"<ENTER>
an 8600.17.30.07 SuRactions.Idioms.PHP.Start\ KCacheGrind :silent !start surastart "C:\Program Files\EasyPHP 2.0b1\profiles" "C:\Program Files\KDE\bin\kcachegrind.exe"<ENTER>
an 8600.17.30.08 SuRactions.Idioms.PHP.compiler\ tidy :compiler tidy<ENTER>
an 8600.17.30.09 SuRactions.Idioms.PHP.compiler\ php :compiler php_sf<ENTER>
an 8600.17.30.10 SuRactions.Idioms.PHP.set\ makeprg=make :set makeprg=make<ENTER>

an 8600.19 SuRactions.-sep10- <Nop>

an <silent> 8600.21 SuRactions.Hightight\ PREG\ meta\ chars :let @/='\\\@<!\(\\\\\)*\(' . join(['\^', '\$', '\.', '\[', '\]', '\|', '(', ')', '?', '\*', '+', '{', '}'], '\\|') . '\)'<CR>

an 8600.24 SuRactions.-sep15- <Nop>

an <silent> 8600.25 SuRactions.Create\ tags\ c/c++ :silent !find . -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" <BAR> ctags --c++-kinds=+p --extra=+q --fields=+iaS -L -<CR>
an <silent> 8600.29 SuRactions.Create\ tags\ java :silent !find . -name "*.java" <BAR> ctags --extra=+q --fields=+i -L -<CR>
an <silent> 8600.30 SuRactions.Create\ tags\ PHP/js :silent !find . vendor/ -name "*.php" <BAR> ctags --fields=-a -L - -f - <BAR> grep -Ev '(d<BAR>j<BAR>v<BAR>f)$' > tags<CR>
an <silent> 8600.30 SuRactions.Create\ classlist\ PHP/js :silent !grep -hR '^use ' . <BAR> sort <BAR> uniq -c <BAR> sort -nr <BAR> cut -b 9- > classes<CR>
an <silent> 8600.30 SuRactions.Create\ services\ list\ symfony2 :silent !find -name "services.xml" -exec grep 'id=' '{}' ';' <BAR> grep -o 'id="[^"]*"' <BAR> cut -d '"' -f 2 > dictionary<CR>

an 8600.40 SuRactions.-sep20- <Nop>

an 8600.70 SuRactions.Show\ tags :set tags<CR>
an 8600.80 SuRactions.-sep30- <Nop>
an <silent> 8600.90 SuRactions.Remove\ tags\ file :silent !start cmd /c "rm tags"<CR>



set guioptions-=T
set guioptions+=b

