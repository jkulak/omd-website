<?php
/**
 * @desc Dupa_Article_Container
 * 
 * @author krzysiek
 *
 */

class Dupa_Article_Container
{
	
	private $_id;
	
	public function setId( $id ) {
		$this->_id = $id;
	}
	
	public function getId() {
		return $this->_id;
	}
	
}