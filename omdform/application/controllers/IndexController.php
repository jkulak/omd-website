<?php
class IndexController extends Zend_Controller_Action 
{
	public function init() {
   		/**
   		 * #TODO gdzie jest config?
   		 */
		//$this->view->publicUrl = 'http://webascrazy.net/omdform/public/';
		$this->view->publicUrl = 'http://localhost/omdweb/omdweb/omdform/public/';
		
		//$this->view->apiUrl = 'http://webascrazy.net/omdform/';
		$this->view->apiUrl = 'http://localhost/omdweb/omdweb/omdform/';
   			   	
		$this->view->title = "Panel administracyjny OMD, czyli super formatka ExtJS od Stanioka! Yeah."; 
	}

	public function indexAction() {
   		//$article = new Dupa_Article();
   		/**
   		 * #TODO gdzie jest config?
   		 */
	}
	
	public function getarticlelistAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$articleList = '{'.
			'result : {'.
				'items : ['.
					'{ id : 1, title : "tytuł testowy", addedby : "plajah", status : "enabled" },'.
					'{ id : 2, title : "tytuł testowy2", addedby : "plajah2", status : "enabled" },'.
					'{ id : 3, title : "tytuł testowy3", addedby : "plajah3", status : "enabled" },'.
					'{ id : 4, title : "tytuł testowy4", addedby : "plajah4", status : "enabled" },'.
					'{ id : 5, title : "tytuł testowy5", addedby : "plajah5", status : "enabled" },'.
					'{ id : 6, title : "tytuł testowy6", addedby : "plajah6", status : "enabled" }'.
				']'.
			'}'.
		'}';
		
		echo $articleList;
	}
	
	public function getcategorylistAction() {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		$categoryList = '{'.
			'result : {'.
				'items : ['.
					'{ id : 1, name : "kategoria", addedby : "plajah" },'.
					'{ id : 2, name : "kategoria2", addedby : "plajah2" },'.
					'{ id : 3, name : "kategoria3", addedby : "plajah3" },'.
					'{ id : 4, name : "kategoria4", addedby : "plajah4" },'.
					'{ id : 5, name : "kategoria5", addedby : "plajah5" },'.
					'{ id : 6, name : "kategoria6", addedby : "plajah6" }'.
				']'.
			'}'.
		'}';
		
		echo $categoryList;
	}
}
