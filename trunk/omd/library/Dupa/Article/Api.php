<?php
	include ('Dupa/Article/Dao/MysqlSimple.php');
	class Dupa_Article_Api {
		private $_dao;
		
		function __construct() {
			$this->_dao = new Dupa_Article_Dao_MySqlSimple();
		}
		
		function getArticleList() {
			return ($this->_dao->getArticleList());
		}
	
}
?>