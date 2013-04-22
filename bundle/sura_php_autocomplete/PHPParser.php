<?php

class PHPParser
{
	protected $tokens;
	protected $currentToken;
	protected $currentIndex;
	protected $namespace;
	protected $currentClass;
	protected $curlyBracketDepth;
	protected $inPhp = false;
	protected $autocompleteInfo = array();

	public function __construct($filename) {
		$filename = $filename instanceof SplFileInfo ? $filename->getRealPath() : $filename;
		$tokens = token_get_all(file_get_contents($filename));
		$this->tokens = $tokens;
	}

	protected function tokenId($token)
	{
		return is_array($token) ? $token[0] : $token;
	}

	protected function tokenValue($token)
	{
		return is_array($token) ? $token[1] : $token;
	}

	protected function indexOfNext($tokenType)
	{
		for($i = $this->currentIndex + 1; $i < count($this->tokens); $i++) {
			if($this->tokenId($this->tokens[$i]) == $tokenType) {
				return $i;
			}
		}
		return false;
	}

	protected function valueOfNext($tokenType)
	{
		$index = $this->indexOfNext($tokenType);
		return $index === false ? false : $this->tokenValue($this->tokens[$index]);
	}

	protected function tokenWalker()
	{
		$tokenId = $this->tokenId($this->currentToken);

		if(!$this->inPhp && $tokenId != T_OPEN_TAG) {
			return;
		}
		$this->inPhp = true;

		switch($tokenId) {
			case T_CLOSE_TAG:
				$this->inPhp = false; break;
			case T_NAMESPACE:
				$this->namespace = $this->valueOfNext(T_STRING); break;
			case T_CLASS:
				$this->currentClass = $this->valueOfNext(T_STRING);
				$this->curlyBracketDepth = 0;
				$this->autocompleteInfo[$this->namespace . '\\' . $this->currentClass] = array();
				break;
			case '{':
				$this->curlyBracketDepth += 1; break;
			case '}':
				$this->curlyBracketDepth -= 1; break;
			case T_FUNCTION: case T_CONST:
				if(null !== $this->currentClass) {
					$this->autocompleteInfo[$this->namespace . '\\' . $this->currentClass][] = $this->valueOfNext(T_STRING);
				}
				break;
		}
	}

	public function parse()
	{
		foreach($this->tokens as $index => $token) {
			$this->currentToken = $token;
			$this->currentIndex = $index;
			$this->tokenWalker();
		}
		return $this->autocompleteInfo;
	}

	public static function getInfo($file)
	{
		$parser = new self($file);
		return $parser->parse();
	}
}

