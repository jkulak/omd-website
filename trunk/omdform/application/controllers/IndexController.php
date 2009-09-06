<?php
class IndexController extends Zend_Controller_Action 
{

	function indexAction() {
   		$article = new Dupa_Article();
   			   	
		$this->view->title = "Panel administracyjny OMD, czyli super formatka ExtJS od Stanioka! Yeah."; 
	}
}