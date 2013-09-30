<?php

namespace DaNamespace;

class Test1
{
	public function __construct()
	{
		self::staticFunction();
		static::staticFunction();
		parent::staticFunction();
		Abc::staticFunction();
		\Def::staticFunction();
	}
}
 
