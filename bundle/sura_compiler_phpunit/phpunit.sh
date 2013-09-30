#!/bin/bash

export PHPSCRIPT=$(cat <<'END'
$input = file_get_contents('php://stdin');
$input = preg_replace('/(in )([^ ]*) on line (\d*)/', "\\1\n\\2:\\3\n", $input);
$parts = preg_split('/(^PHP\s+[0-9]+\..*$)/m', $input, -1, PREG_SPLIT_DELIM_CAPTURE);
echo $parts[0], implode('', array_reverse(array_slice($parts, 1, -1))), $parts[count($parts) - 1];
END
);

phpunit $* 2>&1 | php -r "$PHPSCRIPT"

