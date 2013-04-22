<?php

require(__DIR__ . '/PHPParser.php');


foreach(new RecursiveIteratorIterator(new RecursiveDirectoryIterator('.')) as $file) {
	if(!$file->isFile() || $file->getExtension() != 'php') {
		continue;
	}
	foreach(PHPParser::getInfo($file) as $className => $functions) {
		foreach($functions as $function) {
			if(strpos($className, '\\') !== false) {
				$className = substr($className, strrpos($className, '\\') + 1);
			}
			echo "$className:$function\n";
		}
	}
}

 
