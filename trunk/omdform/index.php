<?php
try{

error_reporting(E_ALL|E_STRICT);
date_default_timezone_set('Europe/London');

set_include_path('.' . PATH_SEPARATOR . './library'
   . PATH_SEPARATOR . './application/models/'
   . PATH_SEPARATOR . get_include_path()
		. PATH_SEPARATOR . '/opt/lampp/htdocs/lib/external/' //Zend
		. PATH_SEPARATOR . '/opt/lampp/htdocs/lib/internal/'); //Hajek to dupa

include "Zend/Loader.php";
Zend_Loader::loadClass('Zend_Controller_Front');
Zend_Loader::loadClass('Zend_Loader_Autoloader');
$loader = Zend_Loader_Autoloader::getInstance()->setFallbackAutoloader(true);

Zend_Layout::startMvc();

// setup controller
$frontController = Zend_Controller_Front::getInstance();
$frontController->throwExceptions(true);
$frontController->setControllerDirectory('./application/controllers');

// run!
$frontController->dispatch();

}catch( Exception $e ) {
	echo '<div style="color: red;"> <h1>FATAL ERROR</h1>';
		echo '<b>error msg:</b> '.$e->getMessage().'<hr />';
		echo '<b>error code:</b> '.$e->getCode().'<hr />';
		echo '<b>error in file:</b> '.$e->getFile().'<hr />';
		echo '<b>error line:</b> '.$e->getLine().'<hr />';
		echo '<b>error trace:</b> '.$e->getTraceAsString().'';
	echo '</div>';
}