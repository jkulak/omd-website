<?php
/**
 * @desc Dupa_List
 * 
 * @author krzysiek
 *
 */

class Dupa_List implements Iterator, ArrayAccess
{
    private $_list = array();
    
    private $_position = 0;
    
    function add( $item ) {
    	array_push( $this->_list, $item );
    }
    
    function count( $item ) {
    	return count( $this->_list );
    }
    
	function rewind() {
        $this->_position = 0;
    }

    function current() {
        return $this->_list[$this->_position];
    }

    function key() {
        return $this->_position;
    }

    function next() {
        ++$this->_position;
    }

    function valid() {
        return isset($this->_list[$this->_position]);
    }

    public function offsetSet($offset, $value) {
        $this->_list[$offset] = $value;
    }
    public function offsetExists($offset) {
        return isset($this->_list[$offset]);
    }
    public function offsetUnset($offset) {
        unset($this->_list[$offset]);
    }
    public function offsetGet($offset) {
        return isset($this->_list[$offset]) ? $this->_list[$offset] : null;
    }
}