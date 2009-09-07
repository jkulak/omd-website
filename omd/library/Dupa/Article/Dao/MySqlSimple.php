<?php

class Dupa_Article_Dao_MySqlSimple {
	function __construct() {
		echo 'construct ' . get_class($this);
	}
	
	public function getArticleList() {
		$query = 'select * from ARTICLES';
		return ('lista artykulow z dao');
	}
}