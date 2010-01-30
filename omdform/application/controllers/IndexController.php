<?php
class IndexController extends Zend_Controller_Action 
{
	private $_api;
	
	private $_apiCategories;
	
	private $_packSize = 50;
	
	public function init() {

   		/**
   		 * #TODO gdzie jest config?
   		 */
		$url = $_SERVER['REQUEST_URI'];
		$this->view->publicUrl = $url . 'public/';
		//$this->view->publicUrl = 'http://localhost/omdweb/omdweb/omdform/public/';
		
		$this->view->apiUrl = $url;
		//$this->view->apiUrl = 'http://localhost/omdweb/omdweb/omdform/';
   			   	
		$this->view->title = "Panel administracyjny OMD"; 
	
		
		
		$this->_api = Dupa_Article_Api::getInstance();
		
		$this->_apiCategories = Dupa_Category_Api::getInstance();
	}
	
	public function _res( $success = true, $id = 0, $data = "[]", $code = 0 ) {
		
		if( $success ) {
			$ret = '{ success : "true", id : '.$id.', data : '.$data.', code : '.$code.' }';
		} else {
			$ret = '{ success : "false", id : '.$id.', data : '.$data.', code : '.$code.' }';
		}
		
		return $ret;
	}

	public function indexAction() {
   		/**
   		 * #TODO gdzie jest config?
   		 */
	}
	
	public function setarticleAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		if( $this->_request->isPost() ) {
    	    $article = new Dupa_Article_Container();
    	    
    	    $articleId = $this->_request->getPost( 'id', null );
    	    $article->setId( $articleId );
					// tymczasowo stripsashes
    	    $article->setTitle( stripslashes($this->_request->getPost( 'title', null ) ) );
    	    $article->setLead( stripslashes($this->_request->getPost( 'lead', null ) ) );
    	    $article->setContent( stripslashes($this->_request->getPost( 'content2', null ) ) );
    	    $article->setAddDate( $this->_request->getPost( 'added', null ) );
        	$article->setAddBy( $this->_request->getPost( 'addedby', null ) );
    	    $article->setUpdateBy( $this->_request->getPost( 'updatedby', null ) );
    	    $article->setEnableDate( $this->_request->getPost( 'activate', null ) );
    	    $article->setDisableDate( $this->_request->getPost( 'deactivate', null ) );
    	    $article->setStatus( $this->_request->getPost( 'statusid2', null ) );
    	    
    	    if( $categoryId = $this->_request->getPost( 'categoryid', null ) )
    	    {
    	        $category = new Dupa_Category_Container();
    	        $category->setId( $categoryId );
    	        $article->setCategory( $category );
    	    }
    	    
    	    try
    	    {
    	    	$ret = false;
	    	    if( $articleId ) {
	    	    	$ret = $this->_api->setArticle( $article );
	    	    } else {
	    	    	$ret = $this->_api->addArticle( $article );
	    	    }
    	    	
	    	    echo $this->_res( $ret, $ret );
	    	    
    	    } catch( Dupa_Exception $e ) {
    	    	echo $this->_res( false );
    	    }
			
		}
	}
	
	public function delarticleAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$id = $this->_request->getPost( 'id', null );
		
		$this->_api->delArticle( $id );
		
		echo $this->_res( true );
	}
	
	public function getarticleAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$id = $this->_request->getPost( 'id', null );
		
		if( $id ) {
			
    	    try{
    	    	$data = array();
    	    	
				$article = $this->_api->getArticle( $id );

    		    $data['id'] = $article->getId();
    		    $data['title'] = $article->getTitle();
    		    $data['lead'] = $article->getLead();
    		    $data['content'] = $article->getContent();
    		    $data['added'] = $article->getAddDate();
    		    $data['addedby'] = $article->getAddBy();
    		    $data['updated'] = $article->getUpdateDate();
    		    $data['updatedby'] = $article->getUpdateBy();
    		    $data['activate'] = $article->getEnableDateFull();
    		    $data['deactivate'] = $article->getDisableDate();
    		    $data['status'] = $article->getStatus();
    		    $data['category'] = $article->getCategory(0) ? $article->getCategory(0)->getId() : null;
				    	    	
	    	    echo $this->_res( true, true, Zend_Json::encode( $data ) );
	    	    
    	    } catch( Dupa_Exception $e ) {
    	    	echo $this->_res( false );
    	    }
			
		} else {
			echo $this->_res( false );
		}
	}
	
	public function getarticlelistAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$first = $this->_request->getParam( 'first', 1 );
		//$pack = ( $first > 1 ) ? ( ( $first / 40 ) + 1 ) : $first;
        $packSize = $this->_packSize;
		$pack = ( $first > 1 ) ? ( floor( $first / $packSize ) ) : 1;
		
		$cnt = $this->_api->getArticlesCountForm();
		
		$items = array(
			'result' => array(
				'items' => array(),
				'total' => isSet( $cnt[0]['rows'] ) ? $cnt[0]['rows'] : 0
			)
		);
		$list = $this->_api->getArticlesListForm( null, $pack, $packSize, Dupa_Article_Api::SORT_ORDER_DESC );

		$i = 0;
		if( $list )
		{
			for( $i = 0, $cnt = count( $list ); $i < $cnt; $i++ )
			{
			    $cats = $list[$i]->getCategories();
				$items['result']['items'][$i]['id']      	  = $list[$i]->getId();
				$items['result']['items'][$i]['title']   	  = $list[$i]->getTitle();
				$items['result']['items'][$i]['categoryName'] = isset( $cats[0] ) ? $cats[0]->getName() : '';
				$items['result']['items'][$i]['status']  	  = $list[$i]->getStatus();
			}
		}
		
		echo Zend_Json::encode( $items );
	}
	
	public function setcategoryAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		if( $this->_request->isPost() ) {
    	    $category = new Dupa_Category_Container();
    	    
    	    $categoryId = $this->_request->getPost( 'id', null );
    	    
    	    $category->setId( $categoryId );
    	    $category->setName( $this->_request->getPost( 'name', null ) );
    	    
    	    try{
    	    	$ret = false;
	    	    if( $categoryId ) {
	    	    	$ret = $this->_apiCategories->setCategory( $category );
	    	    } else {
	    	    	$ret = $this->_apiCategories->addCategory( $category );
	    	    }
    	    	
	    	    echo $this->_res( $ret, $ret );
	    	    
    	    } catch( Dupa_Exception $e ) {
    	    	echo $this->_res( false );
    	    }
			
		}	
	}
	
	public function delcategoryAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$id = $this->_request->getPost( 'id', null );
		
		$ret = $this->_apiCategories->delCategory( $id );
		
		if( $ret == 666 ) {
			echo $this->_res( true, 0, '[]', 666 );
		} else {
			echo $this->_res( true );
		}
	}
	
	
	public function getcategoryAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$id = $this->_request->getPost( 'id', null );
		
		if( $id ) {
			
    	    try{
    	    	$data = array();
    	    	
				$category = $this->_apiCategories->getCategory( $id );
				
    		    $data['id'] = $category->getId();
    		    $data['name'] = $category->getName();
				
    	    	
	    	    echo $this->_res( true, true, Zend_Json::encode( $data ) );
	    	    
    	    } catch( Dupa_Exception $e ) {
    	    	echo $this->_res( false );
    	    }
			
		} else {
			echo $this->_res( false );
		}
	}
	
	public function getcategorylistAction() {

		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$first = $this->_request->getParam( 'first', 1 );
		$first = ( $first > 1 ) ? ( ( $first / 40 ) + 1 ) : $first;
		
		$cnt = $this->_apiCategories->getCategoriesCount();
		
		$items = array(
			'result' => array(
				'items' => array(),
				'total' => isSet( $cnt[0]['rows'] ) ? $cnt[0]['rows'] : 0
			)
		);

		$list = $this->_apiCategories->getCategoriesList( $first );
		
		$i = 0;
		if( $list )
		{
			for( $i = 0, $cnt = count( $list ); $i < $cnt; $i++ )
			{
				$items['result']['items'][$i]['id']      = $list[$i]->getId();
				$items['result']['items'][$i]['name']    = $list[$i]->getName();
				$items['result']['items'][$i]['addedby'] = $list[$i]->getAddBy();
			}
		}
		echo Zend_Json::encode( $items );
	}
}
