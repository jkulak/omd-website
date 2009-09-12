<?php

require_once 'Dupa/Article/Container.php';  
require_once 'Dupa/Exception.php';
require_once 'Dupa/List.php';    

/**
 * Api do artykulow
 * uzycie: $Article = Dupa_Article_Api::getInstance();
 * 		   $Article->getArticle( $id );
 * 
 * @author Playah
 */
class Dupa_Article_Api
{
	const DB_ADAPTER	= 'Pdo_Mysql';
	const DB_HOST		= 'localhost';
	const DB_NAME		= 'hhbd_omd';
	const DB_USER		= 'root';
	const DB_PASS		= '';
	const DB_TABLE      = 'ARTICLES';
	const DB_TABLE_REL  = 'CATEGORIES_has_ARTICLES';
	
	/**
	 * Domyslne wartosci paczkowania
	 */
    const DEFAULT_PACK        = 1;
    const DEFAULT_PACKSIZE    = 40;
    
	private $_db;
	
	static private $_instance;
	
	/**
	 * Konstruktor
	 * 
	 * @return Dupa_Article_Api
	 */
	private function __construct()
	{
		$params = array( 'host'		=> self::DB_HOST,
						 'dbname'	=> self::DB_NAME,
						 'username'	=> self::DB_USER,
						 'password'	=> self::DB_PASS );
		try
		{
			$this->_db = Zend_Db::factory( self::DB_ADAPTER, $params );
			$this->_db->getConnection();
		}
		catch( Zend_Db_Adapter_Exception $e )
		{
		    // problem z baza lub zalogowaniem do niej
		}
		catch( Zend_Exception $e )
		{
		    // problem z zaladowaniem odpowiedniego adaptera bazy
		}
	}
	
	/**
	 * Pobranie instancji klasy
	 * 
	 * @return Dupa_Article
	 */
	static public function getInstance()
	{
		if( !self::$_instance )
			self::$_instance = new Dupa_Article_Api();
		return self::$_instance;
	}
	
	/**
	 * Pobranie artykulu o okreslonym id
	 * 
	 * @param $id Id artykulu
	 * 
	 * @return Dupa_Article_Container
	 */
	public function getArticle( $id )
	{
	    $res = null;
		$id = intval( $id );
		
		if( $id > 0 )
		{
    		$query = 'SELECT '.self::DB_TABLE_REL.'.CATEGORIES_id as categoryId, id, title, lead, content, added, addedby, updated, updatedby, activate, deactivate, status FROM ' . self::DB_TABLE . 
    				' LEFT JOIN '.self::DB_TABLE_REL.' ON '.self::DB_TABLE.'.id = '.self::DB_TABLE_REL.'.ARTICLES_id WHERE id = ?';
    		
    		try
    		{
    		    $result = $this->_db->fetchAll( $query, $id );
    		}		
    		catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error getting article', Dupa_Exception::ERROR_DB );
    		}
    		
    		if( $result )
    		{
    		    $article = new Dupa_Article_Container();
    		    
    		    $article->setId( $result[0]['id'] );
    		    $article->setTitle( $result[0]['title'] );
    		    $article->setLead( $result[0]['lead'] );
    		    $article->setContent( $result[0]['content'] );
    		    $article->setAddDate( $result[0]['added'] );
    		    $article->setAddBy( $result[0]['addedby'] );
    		    $article->setUpdateDate( $result[0]['updated'] );
    		    $article->setUpdateBy( $result[0]['updatedby'] );
    		    $article->setEnableDate( $result[0]['activate'] );
    		    $article->setDisableDate( $result[0]['deactivate'] );
    		    $article->setStatus( $result[0]['status'] );
    		    $article->setCategory( $result[0]['categoryId'] );
    		    $res = $article;
    		}
		}
		else
		    throw new Dupa_Exception( 'Error getting article', Dupa_Exception::ERROR_VALIDATE );

		return $res;
	}
	
	/**
	 * Dodanie artykulu
	 * 
	 * @param $article Artykul
	 * @param $categoryId Id kategorii
	 * 
	 * @return int Id dodanego artykulu
	 */
	public function addArticle( Dupa_Article_Container $article, $categoryId )
	{
	    $res = null;

		if( $article )
		{
		    $data = array(
		                'title'	    => $article->getTitle(),
		                'lead'	    => $article->getLead(),
		                'content'	=> $article->getContent(),
		                'updated'	=> date( 'Y-m-d H:i:s' ),
		                'addedby'	=> $article->getAddBy(),
		                'updated'	=> date( 'Y-m-d H:i:s' ),
		                'updatedby' => $article->getUpdateBy(),
		                'activate'	=> $article->getEnableDate(),
		                'deactivate' => $article->getDisableDate(),
		                'status'	=> $article->getStatus() );

		    try
		    {
    		    $result = $this->_db->insert( self::DB_TABLE, $data );
		    }
			catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error adding article', Dupa_Exception::ERROR_DB );
    		}

    		if( $result == 1 ) {
                $id = $this->_db->lastInsertId();
                
                if( $categoryId ) {
	    	    	 $result = $this->_db->insert( self::DB_TABLE_REL, array(
	    	    	 	'CATEGORIES_id' => $categoryId,
	    	    	 	'ARTICLES_id'   => $id
	    	    	 ) );
                }
    		} else {
                throw new Dupa_Exception( 'Error adding article', Dupa_Exception::ERROR_DB );
    		}
		}
		else
		    throw new Dupa_Exception( 'Error adding article', Dupa_Exception::ERROR_VALIDATE );

		return $id;
	}	
	
	/**
	 * Modyfikacja artykulu
	 * 
	 * @param $article Artykul
	 * @param $categoryId Id kategorii
	 * 
	 * @return bool Czy modyfikacja sie powiodla
	 */
	public function setArticle( Dupa_Article_Container $article, $categoryId )
	{
	    $res = null;

		if( $article )
		{
		    $data = array(
		                'title'	    => $article->getTitle(),
		                'lead'	    => $article->getLead(),
		                'content'	=> $article->getContent(),
		                'updated'	=> date( 'Y-m-d H:i:s' ),
		                'updatedby' => $article->getUpdateBy(),
		                'activate'	=> $article->getEnableDate(),
		                'deactivate' => $article->getDisableDate(),
		                'status'	=> $article->getStatus() );

		    try
		    {
    		    $result = $this->_db->update( self::DB_TABLE, $data, 'id = ' . $article->getId() );
		    	
    		    if( $categoryId ) {
	    		    $isCat = $this->_db->fetchAll( 'SELECT ARTICLES_id FROM '.self::DB_TABLE_REL.' WHERE ARTICLES_id = ' . $article->getId() );

	    		    if( isSet( $isCat[0]['ARTICLES_id'] ) ) {
	    		    	 $result = $this->_db->update( self::DB_TABLE_REL, array(
	    		    	 	'CATEGORIES_id' => $categoryId
	    		    	 ), 'ARTICLES_id = ' . $article->getId() );
	    		    } else {
	    		    	 $result = $this->_db->insert( self::DB_TABLE_REL, array(
	    		    	 	'CATEGORIES_id' => $categoryId,
	    		    	 	'ARTICLES_id'   => $article->getId()
	    		    	 ) );
	    		    }
    		    }
		    }
			catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error setting article', Dupa_Exception::ERROR_DB );
    		}
		}
		else
		    throw new Dupa_Exception( 'Error setting article', Dupa_Exception::ERROR_VALIDATE );

		return $result;
	}
	
	/**
	 * Usuniecie artykulu
	 * 
	 * @param $id Id artykulu
	 * 
	 * @return bool Czy usuniecie sie powiodlo
	 */
	public function delArticle( $id )
	{
	    $res = null;
        $id = intval( $id );
        
		if( $id > 0 )
		{
		    try
		    {
    		    $result = $this->_db->delete( self::DB_TABLE, 'id = ' . $id );
		    }
			catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error deleting article', Dupa_Exception::ERROR_DB );
    		}
		}
		else
		    throw new Dupa_Exception( 'Error deleting article', Dupa_Exception::ERROR_VALIDATE );

		return $result;
	}	
	
	/**
	 * Pobranie listy artykulow
	 * 
	 * @param int $pack Numer paczki
	 * @param int $packSize Wielkosc paczki
	 * 
	 * @return Dupa_List
	 */
	public function getArticlesList( $pack = null, $packSize = null )
	{
	    $pack = intval( $pack ) ? intval( $pack ) : self::DEFAULT_PACK;
	    $packSize = intval( $packSize ) ? intval( $packSize ) : self::DEFAULT_PACKSIZE;
	    $list = null;
	    
		$start = ( $pack - 1 ) * $packSize;
		$end = $packSize;
	    
		$query = 'SELECT id, title, lead, added, addedby, updated, updatedby, activate, deactivate, status ' .
		         'FROM ' . self::DB_TABLE . '  ORDER by id DESC limit ' . $start .', ' . $end;
		
		try
		{
		    $result = $this->_db->fetchAll( $query );
		}		
		catch( Zend_Db_Exception $e )
		{
		    throw new Dupa_Exception( 'Error getting articles list', Dupa_Exception::ERROR_DB );
		}

		if( $result )
		{
		    $list = new Dupa_List();
		    for( $i = 0, $cnt = count( $result ); $i < $cnt; $i++ )
		    {
    		    $article = new Dupa_Article_Container();
    		    
    		    $article->setId( $result[$i]['id'] );
    		    $article->setTitle( $result[$i]['title'] );
    		    $article->setLead( $result[$i]['lead'] );
    		    $article->setAddDate( $result[$i]['added'] );
    		    $article->setAddBy( $result[$i]['addedby'] );
    		    $article->setUpdateDate( $result[$i]['updated'] );
    		    $article->setUpdateBy( $result[$i]['updatedby'] );
    		    $article->setEnableDate( $result[$i]['activate'] );
    		    $article->setDisableDate( $result[$i]['deactivate'] );
    		    $article->setStatus( $result[$i]['status'] );
    		    
    		    $list[$i] = $article;
		    }
		}

		return $list;
	}
	
	public function getArticlesCnt()
	{
		$query = 'SELECT COUNT(*) as rows FROM ' . self::DB_TABLE;
		try
		{

		    return $result = $this->_db->fetchAll( $query );

		}		
		catch( Zend_Db_Exception $e )
		{
		    throw new Dupa_Exception( 'Error getting articles count', Dupa_Exception::ERROR_DB );
		}
	}
}
