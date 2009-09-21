<?php

require_once 'Dupa/Article/Api.php';  

class IndexController extends Zend_Controller_Action
{
	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
	} 
   
	function indexAction()
	{
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $articles = $ArticlesApi->getArticlesList( 1, 1 );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    
	    $this->view->addNews = $articles;
	}

    function kontaktAction() {
    }
    
    function onasAction() {
    }

	function aktualnosciAction()
	{
		//$this->view->render( '' );
	}
	
	function zespolAction() {
		echo 123;
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
}