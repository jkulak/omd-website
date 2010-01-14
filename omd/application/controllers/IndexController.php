<?php

require_once 'Dupa/Article/Api.php';
require_once 'Zend/Mail.php';    
require_once 'Zend/Mail/Transport/Smtp.php';
require_once 'Dupa/Service/Api/Twitter.php';

class IndexController extends Zend_Controller_Action
{
    const MAIL_SEND_FROM_HOST  = ''; // przyklad: 'poczta.interia.pl'
    const MAIL_SEND_FROM_USER  = ''; // przyklad: 'kotletschabowy'
    const MAIL_SEND_FROM_PASS  = ''; // przyklad: 'haslo123'
    const MAIL_SEND_FROM_EMAIL = ''; // przyklad: 'kotletschabowy@interia.pl'
    const MAIL_SEND_TO_EMAIL   = ''; // przyklad: 'biuro@omd.com'
    
    private $_months = array( '01' => 'Styczen',
                              '02' => 'Luty',
                              '03' => 'Marzec',
                              '04' => 'Kwiecien',
                              '05' => 'Maj',
                              '06' => 'Czerwiec',
                              '07' => 'Lipiec',
                              '08' => 'Sierpien',
                              '09' => 'Wrzesien',
                              '10' => 'Pazdziernik',
                              '11' => 'Listopad',
                              '12' => 'Grudzien'    
                             );
    
	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
		
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $categoryId = 2; //aktualnosci
	        $pack = 1;
	        $packSize = 3;
	        $sort = Dupa_Article_Api::SORT_ORDER_DESC;
	        $articles = $ArticlesApi->getArticlesList( $categoryId, $pack, $packSize, $sort );

	        //$ArticlesApi->getArticlesList( null, null, null, null, '2009', '11' );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    
	    $this->view->addNews = $articles;
	
		// pobranie wpisu z tweetera
		$twitterApi = new Phly_Twitter('', '');
		$params = array(
			'id' => 'OptimumMediaOMD',
			'count' => 3
			);
		$response = $twitterApi->statusUserTimeline($params);
		//$tweet = $response->status[rand(0, 2)]->text;
		$this->view->tweets = array();
		for ($i=0; $i < 3; $i++) { 
			$this->view->tweets[] = $response->status[$i]->text;
		}
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
                             'username' => self::MAIL_SEND_FROM_USER,
                             'password' => self::MAIL_SEND_FROM_PASS );
            
            $transport = new Zend_Mail_Transport_Smtp( self::MAIL_SEND_FROM_HOST, $config );

            $mail = new Zend_Mail( 'UTF-8' );
            
            $body = "Instytucja:\n" . $post['institution'];
            $body .= "\n\nImię i nazwisko:\n" . $post['name'];
            $body .= "\n\nE-mail:\n" . $post['email'];
            $body .= "\n\nTelefon:\n" . $post['telephone'];
            $body .= "\n\nWiadomość:\n" . $post['message'];            
            
            $mail->setBodyText( $body );
            $mail->setFrom( self::MAIL_SEND_FROM_EMAIL, 'OMD' );
            $mail->addTo( self::MAIL_SEND_TO_EMAIL, 'OMD' );
            $mail->setSubject( 'Nowa wiadomość' );
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
			$ArticlesApi = Dupa_Article_Api::getInstance();
	    try
	    {
            $article = $ArticlesApi->getArticle( 9 );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    $this->view->article = $article;
    }

	function aktualnosciAction()
	{
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $pack = intval( $this->getRequest()->getQuery( 'p' ) );
	        $pack = $pack ? $pack : 1;
	        
	        $categoryId = 2;
	        $packSize = 5;
	        $order = Dupa_Article_Api::SORT_ORDER_DESC;
	        $articles = $ArticlesApi->getArticlesList( $categoryId, $pack, $packSize, $order );
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
			$ArticlesApi = Dupa_Article_Api::getInstance();
	    try
	    {
            $article = $ArticlesApi->getArticle( 10 );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    $this->view->article = $article;
	}
	
	function artykulAction()
	{	    
	    $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    $articleId = intval( $this->getRequest()->getQuery( 'id' ) );
	    
	    try
	    {
            $article = $ArticlesApi->getArticle( $articleId );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	    
	    $this->view->article = $article;
	}
	
	function archiwumAction()
	{
	    $ArticlesApi = Dupa_Article_Api::getInstance();

	    // jezeli wybrano juz date
	    if( $date = $this->getRequest()->getQuery( 'date' ) )
	    {
    	    try
    	    {
    	        $categoryId = null;
    	        $pack = 1;
    	        $packSize = 5;
    	        $order = Dupa_Article_Api::SORT_ORDER_DESC;
    	        $dates = explode( '-', $date );
    	        $articles = $ArticlesApi->getArticlesList( $categoryId, $pack, $packSize, $order, $dates[0], $dates[1] );
    	    }
    	    catch( Exception $e )
    	    {
    	        echo $e->getMessage();
    	    }
    
    	    $this->view->archive = $articles;
	    }
	    else
	    {
    	    try
    	    {
    	        $dates = $ArticlesApi->getArticlesDates();
    	    }
    	    catch( Exception $e )
    	    {
    	        echo $e->getMessage();
    	    }

    	    $this->view->dates = $dates;
    	    $this->view->months = $this->_months;	
	    }
	}
}