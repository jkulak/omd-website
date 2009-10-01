<?php

require_once 'Dupa/Article/Api.php';
require_once 'Zend/Mail.php';    
require_once 'Zend/Mail/Transport/Smtp.php';

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

    function kontaktAction()
    {
        if( $this->getRequest()->isPost() )
        {
            $post = $this->getRequest()->getPost();
            
            $config = array( 'auth' => 'login',
                             'username' => 'vas2',
                             'password' => 'analfabeta' );
            
            $transport = new Zend_Mail_Transport_Smtp( 'poczta.interia.pl', $config );

            $mail = new Zend_Mail( 'UTF-8' );
            $mail->setBodyText( $post['message'] );
            $mail->setFrom( 'vas2@interia.pl', 'Vas' );
            $mail->addTo( 'Pawel.Hajek@gmail.com', 'Odbiorca' );
            $mail->setSubject( 'Temat' );
            try
            {
                $mail->send( $transport );
                $message = 'Wiadomość została wysłana.';                
            }
            catch( Zend_Mail_Protocol_Exception $e )
            {
                $message = 'Wystąpił błąd podczas wysyłania wiadmomości. Spróbuj później.';
            }
            $this->view->message = $message;
        }

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