<?php
class IndexController extends Zend_Controller_Action 
{

	function indexAction() {
   		//$article = new Dupa_Article();
   		/**
   		 * #TODO gdzie jest config?
   		 */
		$this->view->publicUrl = 'http://localhost/omdweb/omdweb/omdform/public/';
		
   			   	
		$this->view->title = "Panel administracyjny OMD, czyli super formatka ExtJS od Stanioka! Yeah."; 
	}
}