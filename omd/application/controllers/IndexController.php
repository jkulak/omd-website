<?php

require_once 'Dupa/Article/Api.php';
require_once 'Zend/Mail.php';    
require_once 'Zend/Mail/Transport/Smtp.php';
require_once 'Zend/Validate/EmailAddress.php';
require_once 'Dupa/Service/Api/Twitter.php';

class IndexController extends Zend_Controller_Action
{
    const MAIL_SEND_FROM_HOST  = '213.17.164.67'; // przyklad: 'poczta.interia.pl'
    //const MAIL_SEND_FROM_HOST  = '213.17.164.67'; // przyklad: 'poczta.interia.pl'    
    const MAIL_SEND_FROM_USER  = 'om584'; // przyklad: 'kotletschabowy'
    const MAIL_SEND_FROM_PASS  = 'web467dfg'; // przyklad: 'haslo123'
    //const MAIL_SEND_FROM_EMAIL = 'info@optimum-media.pl'; // przyklad: 'kotletschabowy@interia.pl'
    const MAIL_SEND_FROM_EMAIL = 'optimum-media@optimum-media.pl'; // przyklad: 'kotletschabowy@interia.pl'
    const MAIL_SEND_TO_EMAIL   = 'jakub.kulak@gmail.com'; // przyklad: 'biuro@omd.com'
    
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
	    $this->view->addNews = array();
			for ($i=0; $i < 3 && $i < count( $articles ); $i++) { 
				$this->view->addNews[] = $articles[$i]->getLead();
			}
	
		// pobranie wpisu z tweetera
		$twitterApi = new Phly_Twitter('', '');
		$params = array(
			'id' => 'OptimumMediaOMD',
			'count' => 3
			);
		$response = $twitterApi->statusUserTimeline($params);
		
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
            //$transport = new Zend_Mail_Transport_Smtp( self::MAIL_SEND_FROM_HOST );

            $mail = new Zend_Mail( 'UTF-8' );
            
            $body = "Instytucja:\n" . $post['institution'];
            $body .= "\n\nImię i nazwisko:\n" . $post['name'];
            $body .= "\n\nStanowisko:\n" . $post['position'];
            $body .= "\n\nE-mail:\n" . $post['email'];
            $body .= "\n\nTelefon:\n" . $post['telephone'];
            $body .= "\n\nWiadomość:\n" . $post['message'];            
            
            $mail->setBodyText( $body );
            $mail->setFrom( self::MAIL_SEND_FROM_EMAIL, 'OMD' );
            $mail->addTo( self::MAIL_SEND_TO_EMAIL, 'OMD' );
            if( isset( $post['copy'] ) && $post['copy'] == 'on' )
            {
                $validator = new Zend_Validate_EmailAddress();
                if( $validator->isValid( $post['email'] ) )
                {
                    $mail->addTo( $post['email'], $post['name'] );
                }
            }
                
            $mail->setSubject( 'Nowa wiadomość' );
            
            try
            {
                $result = $mail->send( $transport );
								echo 'test.jkulak';
								print_r($result);
					
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
		 $ArticlesApi = Dupa_Article_Api::getInstance();
	    
	    try
	    {
	        $pack = intval( $this->getRequest()->getQuery( 'p' ) );
	        $pack = $pack ? $pack : 1;
	        
	        $categoryId = 3;
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