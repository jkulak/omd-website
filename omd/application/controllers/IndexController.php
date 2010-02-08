<?php

require_once 'Dupa/Article/Api.php';
require_once 'Zend/Mail.php';    
require_once 'Zend/Mail/Transport/Smtp.php';
require_once 'Zend/Validate/EmailAddress.php';
require_once 'Dupa/Service/Api/Twitter.php';

class IndexController extends Zend_Controller_Action
{

		const MAIL_SEND_FROM_HOST  = '213.17.164.67';
    const MAIL_SEND_FROM_USER  = 'om584';
    const MAIL_SEND_FROM_PASS  = 'web467dfg';
    const MAIL_SEND_FROM_EMAIL = 'optimum-media@optimum-media.pl';
    const MAIL_SEND_TO_EMAIL   = 'optimum-media@optimum-media.pl';
		/*
		const MAIL_SEND_FROM_HOST  = 'smtp.googlemail.com';
    const MAIL_SEND_FROM_USER  = 'jakub.kulak';
    const MAIL_SEND_FROM_PASS  = '';
    const MAIL_SEND_FROM_EMAIL = 'jakub.kulak@gmail.com';
    const MAIL_SEND_TO_EMAIL   = 'jakub.kulak@gmail.com';
		const MAIL_SEND_FROM_PORT  = 587;
		const MAIL_SEND_FROM_CONNECTION_TYPE = 'TLS';
		*/
    
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

			if (isset($articles)) {
				$this->view->addNews = array();
				for ($i=0; $i < 3 && $i < count( $articles ); $i++) { 
					$this->view->addNews[] = $articles[$i]->getLead();
				}
			}
			
			Zend_Loader::loadClass('Models_Twitter');
			$twitter = new Models_Twitter();
			$this->view->tweets = $twitter->getTwitts();
	} 
   
	function indexAction()
	{
	}

    function kontaktAction()
    {
			Zend_Loader::loadClass('forms_ContactForm');
			$form = new forms_ContactForm();
			
			if( $this->getRequest()->isPost() )
			{
				$formData = $this->getRequest()->getPost();
				
				if ( $form->isValid( $formData ) )
				{
					$config = array( 'auth' => 'login',
                            'username' => self::MAIL_SEND_FROM_USER,
                            'password' => self::MAIL_SEND_FROM_PASS);

           $transport = new Zend_Mail_Transport_Smtp( self::MAIL_SEND_FROM_HOST, $config );

           $mail = new Zend_Mail( 'UTF-8' );
           
           $body = "Instytucja:\n" . $formData['institution'];
           $body .= "\n\nImię i nazwisko:\n" . $formData['name'];
           $body .= "\n\nStanowisko:\n" . $formData['position'];
           $body .= "\n\nE-mail:\n" . $formData['email'];
           $body .= "\n\nTelefon:\n" . $formData['telephone'];
           $body .= "\n\nWiadomość:\n" . $formData['message'];            
           
           $mail->setBodyText( $body );
           $mail->setFrom( self::MAIL_SEND_FROM_EMAIL, 'Formularz z optimum-media.pl' );
           $mail->addTo( self::MAIL_SEND_TO_EMAIL, 'OMD' );
           if( isset( $formData['copy'] ) && $formData['copy'] == 'on' )
           {
               $validator = new Zend_Validate_EmailAddress();
               if( $validator->isValid( $formData['email'] ) )
               {
                   $mail->addTo( $formData['email'], $formData['name'] );
               }
           }
               
           $mail->setSubject( 'Nowa wiadomość od: ' . $formData['name'] );
           
           try
           {
               $res = $mail->send( $transport );
               $message = 'Wiadomość została wysłana.';                
           }
           catch( Zend_Mail_Protocol_Exception $e )
           {
						$message = 'Wystąpił błąd podczas wysyłania wiadmomości. Spróbuj później.';
           }
           $this->view->message = $message;
			  }
				else
				{
					$form->populate( $formData );
				}
		}
			
		$this->view->form = $form;
            

			$ArticlesApi = Dupa_Article_Api::getInstance();
	    try
	    {
	          $article = $ArticlesApi->getArticle( 35 );
	    }
	    catch( Exception $e )
	    {
	        echo $e->getMessage();
	    }
	  $this->view->article = $article;
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
	
	function mapastronyAction() {
		
	}
	
	function narzedziaAction() {
		$ArticlesApi = Dupa_Article_Api::getInstance();
    try
    {
          $article = $ArticlesApi->getArticle( 36 );
    }
    catch( Exception $e )
    {
        echo $e->getMessage();
    }
    $this->view->article = $article;
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
		$ArticlesApi = Dupa_Article_Api::getInstance();
    try
    {
          $article = $ArticlesApi->getArticle( 33 );
    }
    catch( Exception $e )
    {
        echo $e->getMessage();
    }
    $this->view->article = $article;
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
	
	function analizaAction()
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