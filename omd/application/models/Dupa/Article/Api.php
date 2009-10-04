<?php

require_once 'Dupa/Article/Container.php';  
require_once 'Dupa/Exception.php';
require_once 'Dupa/List.php';    
require_once 'Zend/Db.php';   

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
	const DB_USER		= 'hhbd_www';
	const DB_PASS		= 'www';
	
	/**
	 * Domyslne wartosci paczkowania
	 */
    const DEFAULT_PACK        = 1;
    const DEFAULT_PACKSIZE    = 10;
	
	/**
	 * Domyslne wartosci kierunku sortowania
	 */
    const SORT_ORDER_ASC      = 'asc';
    const SORT_ORDER_DESC     = 'desc';
    const SORT_ORDER_DEFAULT  = self::SORT_ORDER_ASC;
    
	private $_db;
	
	static private $_instance;
	
	/**
	 * Konstruktor
	 * 
	 * @return void
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
    		$query = 'SELECT id, title, lead, content, added, addedby, updated, updatedby, activate, deactivate, status FROM ARTICLES WHERE id = ?';
    		
    		try
    		{
    		    $result = $this->_db->fetchAll( $query, $id );
    		}		
    		catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error getting article: ' . $e->getMessage(), Dupa_Exception::ERROR_DB );
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
	 * 
	 * @return int Id dodanego artykulu
	 */
	public function addArticle( Dupa_Article_Container $article )
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
    		    $result = $this->_db->insert( 'ARTICLES', $data );
		    }
			catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error adding article: ' . $e->getMessage(), Dupa_Exception::ERROR_DB );
    		}

    		if( $result == 1 )
                $id = $this->_db->lastInsertId();
            else
                throw new Dupa_Exception( 'Error adding article', Dupa_Exception::ERROR_DB );
		}
		else
		    throw new Dupa_Exception( 'Error adding article', Dupa_Exception::ERROR_VALIDATE );

		return $id;
	}	
	
	/**
	 * Modyfikacja artykulu
	 * 
	 * @param $article Artykul
	 * 
	 * @return bool Czy modyfikacja sie powiodla
	 */
	public function setArticle( Dupa_Article_Container $article )
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
    		    $result = $this->_db->update( 'ARTICLES', $data, 'id = ' . $article->getId() );
		    }
			catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error setting article: ' . $e->getMessage(), Dupa_Exception::ERROR_DB );
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
    		    $result = $this->_db->delete( 'ARTICLES', 'id = ' . $id );
		    }
			catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error deleting article: ' . $e->getMessage(), Dupa_Exception::ERROR_DB );
    		}
		}
		else
		    throw new Dupa_Exception( 'Error deleting article', Dupa_Exception::ERROR_VALIDATE );

		return $result;
	}	
	
	/**
	 * Pobranie listy artykulow
	 * 
	 * @param int $categoryId Id kategorii; jezeli nie podano - pobierz ze wszystkich
	 * @param int $pack Numer paczki
	 * @param int $packSize Wielkosc paczki
	 * @param string $order Sortowanie
	 * @param string $year Rok, z ktorego pobierac artykuly (nalezy podawac tez $month)
	 * @param string $month Miesiac, z ktorego pobierac artykul (nalezy podawac tez $year)
	 * 
	 * @return Dupa_List
	 */
	public function getArticlesList( $categoryId = null, $pack = null, $packSize = null, $order = null, $year = null, $month = null )
	{
	    $pack = intval( $pack ) ? intval( $pack ) : self::DEFAULT_PACK;
	    $packSize = intval( $packSize ) ? intval( $packSize ) : self::DEFAULT_PACKSIZE;
	    $categoryId = $categoryId ? intval( $categoryId ) : $categoryId;
	    $order = self::checkSortOrder( $order );
	    
	    if( $year && $month )
	    {
    	    $year = intval( $year );
    	    $month = intval( $month );
    	    $month = $month < 10 ? '0' . strval( $month ) : strval( $month );
    	    $date = $year . '-' . $month;
	    }
	    
		$list = new Dupa_List();
	    
	    if( $categoryId > 0 || $categoryId === null )
	    {    	    
    		$start = ( $pack - 1 ) * $packSize;
    		$end = $packSize;
    		
    		if( !$categoryId )
    		{
        		$query = 'SELECT id, title, lead, added, addedby, updated, updatedby, activate, deactivate, status ' .
        		         'FROM ARTICLES ' .
        		         ( isset( $date ) ? 'WHERE substring( added, 1, 7 ) = "' . $date . '" ': '' ) .
        		         'ORDER by id ' . $order . ' limit ' . $start . ', ' . $end;
        		$queryCnt = 'SELECT count(*) as cnt ' .
            		        'FROM ARTICLES ' .
            		        ( isset( $date ) ? 'WHERE substring( added, 1, 7 ) = "' . $date . '" ': '' );
    		}
            else
            {
        		$query = 'SELECT id, title, lead, added, addedby, updated, updatedby, activate, deactivate, status ' .
        		         'FROM ARTICLES a ' .
        		         'INNER JOIN CATEGORIES_has_ARTICLES ac ON a.id = ac.ARTICLES_id ' .
        		         'WHERE ac.CATEGORIES_id = ' . $categoryId . ' ' .
        		         ( isset( $date ) ? 'AND substring( added, 1, 7 ) = "' . $date . '" ': '' ) .
        		         'ORDER by id ' . $order . ' limit ' . $start . ', ' . $end;
        		$queryCnt = 'SELECT count(*) as cnt ' .
            		        'FROM ARTICLES a ' .
            		        'INNER JOIN CATEGORIES_has_ARTICLES ac ON a.id = ac.ARTICLES_id ' .
            		        'WHERE ac.CATEGORIES_id = ' . $categoryId . ' ' .
            		        ( isset( $date ) ? 'AND substring( added, 1, 7 ) = "' . $date . '" ': '' );
            }
    		
    		try
    		{
    		    $result = $this->_db->fetchAll( $query );
    		    $resultCnt = $this->_db->fetchAll( $queryCnt );
    		}		
    		catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error getting articles list: ' . $e->getMessage(), Dupa_Exception::ERROR_DB );
    		}
    
    		if( $result )
    		{
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
    		    $list->cntItems = $resultCnt[0]['cnt'];
    		}
	    }
		else
		    throw new Dupa_Exception( 'Error getting articles list', Dupa_Exception::ERROR_VALIDATE );
		    
		return $list;
	}
	
	/**
	 * Pobranie listy dat, z kiedy pochodza artykuly
	 * 
	 * @param int $categoryId Id kategorii; jezeli nie podano - pobierz ze wszystkich
	 * @param int $pack Numer paczki
	 * @param int $packSize Wielkosc paczki
	 * 
	 * @return Dupa_List
	 */
	public function getArticlesDates( $categoryId = null, $pack = null, $packSize = null )
	{
	    $pack = intval( $pack ) ? intval( $pack ) : self::DEFAULT_PACK;
	    $packSize = intval( $packSize ) ? intval( $packSize ) : self::DEFAULT_PACKSIZE;
	    $categoryId = $categoryId ? intval( $categoryId ) : $categoryId;
	
		$list = new Dupa_List();
	    
	    if( $categoryId > 0 || $categoryId === null )
	    {    	    
    		$start = ( $pack - 1 ) * $packSize;
    		$end = $packSize;
    		
	        if( !$categoryId )
    		{
        		$query = 'SELECT substring( added, 1, 4 ) as year, substring( added, 6, 2 ) as month ' .
        		         'FROM ARTICLES ' . 
        		         'GROUP BY substring( added, 1, 7 ) ' .
        		         'ORDER BY year, month desc limit ' . $start . ', ' . $end;
    		}
            else
            {
        		$query = 'SELECT substring( added, 1, 4 ) as year, substring( added, 6, 2 ) as month ' .
        		         'FROM articles a ' .
        		         'INNER JOIN CATEGORIES_has_ARTICLES ac ON a.id = ac.ARTICLES_id ' .
        		         'WHERE ac.CATEGORIES_id = ' . $categoryId . ' ' .
        		         'GROUP BY substring( added, 1, 7 ) ' .
        		         'ORDER BY year, month desc limit ' . $start . ', ' . $end;
            }
    		try
    		{
    		    $result = $this->_db->fetchAll( $query );
    		}		
    		catch( Zend_Db_Exception $e )
    		{
    		    throw new Dupa_Exception( 'Error getting articles dates: ' . $e->getMessage(), Dupa_Exception::ERROR_DB );
    		}
	    }
	    return $result;
	}
	
    static public function checkSortOrder( $sortOrder )
    {
        return in_array( $sortOrder, array( self::SORT_ORDER_ASC,
                                            self::SORT_ORDER_DESC ) ) ? $sortOrder : self::SORT_ORDER_DEFAULT;
    }
}
