<?php

require_once 'Dupa/Article/Api.php';  

class IndexController extends Zend_Controller_Action
{
	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
		
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $categoryId = 2;
	        $pack = 1;
	        $packSize = 1;
	        $sort = Dupa_Article_Api::SORT_ORDER_DESC;
	        $articles = $ArticlesApi->getArticlesList( $categoryId, $pack, $packSize, $sort );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    
	    $this->view->addNews = $articles;
	} 
   
	function indexAction()
	{
	}

    function kontaktAction() {
    }
    
    function onasAction() {
    }

	function aktualnosciAction()
	{
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $categoryId = null;
	        $pack = 1;
	        $packSize = 5;
	        $articles = $ArticlesApi->getArticlesList( $categoryId, $pack, $packSize );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }

	    $this->view->mainNews = $articles;
	}
	
	function zespolAction() {

	}
	
	function naszepraceAction() {
		
	}
	
	function narzedziaAction() {
		
	}
	
	function analizyipublikacjeAction() {
		
	}
	
	function omdschoolAction() {
		
	}
	
	function siecomdAction() {
		
	}
	
	function artykulAction()
	{	    
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $articleId = 2;

            $article = $ArticlesApi->getArticle( $articleId );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    
	    $this->view->article = $article;
	}
	
	function barrycupplesAction()
	{
	}
	
	function maggiechoiAction()
	{
	}	
}