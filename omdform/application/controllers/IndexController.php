<?php
class IndexController extends Zend_Controller_Action 
{
	private $_api;
	
	private $_apiCategories;
	
	public function init() {
   		/**
   		 * #TODO gdzie jest config?
   		 */
		//$this->view->publicUrl = 'http://webascrazy.net/omdform/public/';
		$this->view->publicUrl = 'http://localhost/omdweb/omdweb/omdform/public/';
		
		//$this->view->apiUrl = 'http://webascrazy.net/omdform/';
		$this->view->apiUrl = 'http://localhost/omdweb/omdweb/omdform/';
   			   	
		$this->view->title = "Panel administracyjny OMD, czyli super formatka ExtJS od Stanioka! Yeah."; 
	
		
		
		$this->_api = Dupa_Article_Api::getInstance();
		
		$this->_apiCategories = Dupa_Category_Api::getInstance();
	}
	
	public function _res( $success = true, $id = 0, $data = "[]" ) {
		
		if( $success ) {
			$ret = '{ success : "true", id : '.$id.', data : '.$data.' }';
		} else {
			$ret = '{ success : "false", id : '.$id.', data : '.$data.' }';
		}
		
		return $ret;
	}

	public function indexAction() {
   		//$article = new Dupa_Article();
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
    	    $article->setTitle( $this->_request->getPost( 'title', null ) );
    	    $article->setLead( $this->_request->getPost( 'lead', null ) );
    	    $article->setContent( $this->_request->getPost( 'content2', null ) );
    	    $article->setAddDate( $this->_request->getPost( 'added', null ) );
        	$article->setAddBy( $this->_request->getPost( 'addedby', null ) );
    	    $article->setUpdateBy( $this->_request->getPost( 'updatedby', null ) );
    	    $article->setEnableDate( $this->_request->getPost( 'activate', null ) );
    	    $article->setDisableDate( $this->_request->getPost( 'deactivate', null ) );
    	    $article->setStatus( $this->_request->getPost( 'statusid2', null ) );
    	    
    	    $categoryId = $this->_request->getPost( 'categoryid', null );
    	    
    	    try{
    	    	$ret = false;
	    	    if( $articleId ) {
	    	    	$ret = $this->_api->setArticle( $article, $categoryId );
	    	    } else {
	    	    	$ret = $this->_api->addArticle( $article, $categoryId );
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
    		    $data['activate'] = $article->getEnableDate();
    		    $data['deactivate'] = $article->getDisableDate();
    		    $data['status'] = $article->getStatus();
    		    $data['category'] = $article->getCategory();
				
    	    	
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
		$first = ( $first > 1 ) ? ( ( $first / 40 ) + 1 ) : $first;
		
		$cnt = $this->_api->getArticlesCnt();
		
		$items = array(
			'result' => array(
				'items' => array(),
				'total' => isSet( $cnt[0]['rows'] ) ? $cnt[0]['rows'] : 0
			)
		);
		$list = $this->_api->getArticlesList( $first );
		
		$i = 0;
		if( $list ) {
			foreach( $list as $value ) {
				//Zend_Debug::dump( $value );
				$items['result']['items'][$i]['id']      = $value->getId();
				$items['result']['items'][$i]['title']   = $value->getTitle();
				$items['result']['items'][$i]['addedby'] = $value->getAddBy();
				$items['result']['items'][$i]['status']  = $value->getStatus();
				
				$i++;
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
		
		$this->_apiCategories->delCategory( $id );
		
		echo $this->_res( true );
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
		
		$cnt = $this->_apiCategories->getCategoriesCnt();
		
		$items = array(
			'result' => array(
				'items' => array(),
				'total' => isSet( $cnt[0]['rows'] ) ? $cnt[0]['rows'] : 0
			)
		);

		$list = $this->_apiCategories->getCategoriesList( $first );
		
		$i = 0;
		if( $list ) {
			foreach( $list as $value ) {
				//Zend_Debug::dump( $value );
				$items['result']['items'][$i]['id']      = $value->getId();
				$items['result']['items'][$i]['name']    = $value->getName();
				$items['result']['items'][$i]['addedby'] = $value->getAddBy();
				
				$i++;
			}
		}
		echo Zend_Json::encode( $items );
	}
}
