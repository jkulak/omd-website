<?php

/**
 * Obsluga list (tak jak tablic)
 * 
 * @author Playah
 */
class Dupa_List implements ArrayAccess
{
    /**
     * Lista elementow
     * 
     * @var unknown_type
     */
    protected $_items;

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
    
		public function length()
		{
			return count( $this->_items );
    }    
}
?>