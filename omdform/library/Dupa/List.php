<?php

/**
 * Obsluga list (tak jak tablic)
 * 
 * @author Playah
 */
class Dupa_List implements ArrayAccess, Iterator
{
    /**
     * Lista elementow
     * 
     * @var unknown_type
     */
    private $_items;
    
    private $position = 0;

    public function __construct() {
        $this->position = 0;
    }

    function rewind() {
        $this->position = 0;
    }

    function current() {
        return $this->_items[$this->position];
    }

    function key() {
        return $this->position;
    }

    function next() {
        ++$this->position;
    }

    function valid() {
        return isset($this->_items[$this->position]);
    }

    public function offsetSet( $offset, $value )
    {
        $this->_items[$offset] = $value;
    }

    public function offsetExists( $offset )
    {
        return isset( $this->_items[$offset] );
    }

    public function offsetUnset( $offset )
    {
        unset( $this->_items[$offset] );
    }

    public function offsetGet( $offset )
    {
        return $this->_items[$offset];
    }
}
?>