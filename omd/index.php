<?php
function pr( $txt )
{
	echo '<pre style="float:left; clear:both; width:100%; font-size:11px; color:#004871; background:#eaf7ff; border:1px solid #0089d7">';
	print_r( $txt );
	echo '</pre>';
} 
ini_set('display_errors', 0);
defined('ROOT_PATH')
    || define('ROOT_PATH', realpath(dirname(__FILE__) ));

defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath( ROOT_PATH . '/application') ) ;
    
defined('GLOBAL_LIB_PATH')
    || define('GLOBAL_LIB_PATH', 'c:/PHP Libs' ) ;
    
error_reporting(E_ALL|E_STRICT);
date_default_timezone_set('Europe/London');

set_include_path(
      ROOT_PATH
	. PATH_SEPARATOR . realpath( ROOT_PATH .'/library' )
	. PATH_SEPARATOR . realpath( APPLICATION_PATH )
	. PATH_SEPARATOR . realpath( APPLICATION_PATH . '/models' )
	. PATH_SEPARATOR . get_include_path()
	. PATH_SEPARATOR . GLOBAL_LIB_PATH
	. PATH_SEPARATOR . '/home/hhbd/lib/external/');
	
include "Zend/Loader.php";

Zend_Loader::loadClass('Zend_Controller_Front');
Zend_Loader::loadClass('Zend_View');

// setup controller
$frontController = Zend_Controller_Front::getInstance();
//$this->frontController->setParam('noErrorHandler', TRUE);
$frontController->throwExceptions(true);

$frontController->setControllerDirectory( realpath( APPLICATION_PATH . '/controllers' ) );
//$frontController->setControllerDirectory( realpath( APPLICATION_PATH . '/controllers' ), 'omd' );
//$frontController->setBaseUrl('/omd');

$view = new Zend_View;
$view->setEncoding('UTF-8');

Zend_Loader::loadClass('Zend_Controller_Action_HelperBroker');
Zend_Loader::loadClass('Zend_Controller_Action_Helper_ViewRenderer');
Zend_Loader::loadClass('Zend_Layout');

$viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer($view);
Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
Zend_Layout::startMvc(
	array(
		'layoutPath' => realpath( APPLICATION_PATH . '/views/layouts' ),
    	'layout' => 'common'
		)
		);


// print_r($frontController);

$router = $frontController->getRouter(); // returns a rewrite router by default

$router->addRoute('kontakt', new Zend_Controller_Router_Route('kontakt.html', array('controller' => 'index', 'action' => 'kontakt')));
$router->addRoute('onas', new Zend_Controller_Router_Route('o-nas.html', array('controller' => 'index', 'action' => 'onas')));
$router->addRoute('aktualnosci', new Zend_Controller_Router_Route('aktualnosci.html', array('controller' => 'index', 'action' => 'aktualnosci')));
$router->addRoute('zespol', new Zend_Controller_Router_Route('zespol.html', array('controller' => 'index', 'action' => 'zespol')));
$router->addRoute('nasze-prace', new Zend_Controller_Router_Route('nasze-prace.html', array('controller' => 'index', 'action' => 'naszeprace')));
$router->addRoute('narzedzia', new Zend_Controller_Router_Route('narzedzia.html', array('controller' => 'index', 'action' => 'narzedzia')));
$router->addRoute('analizyipublikacje', new Zend_Controller_Router_Route('analizy-i-publikacje.html', array('controller' => 'index', 'action' => 'analizyipublikacje')));
$router->addRoute('omdschool', new Zend_Controller_Router_Route('omd-school.html', array('controller' => 'index', 'action' => 'omdschool')));
$router->addRoute('siecomd', new Zend_Controller_Router_Route('siec-omd.html', array('controller' => 'index', 'action' => 'siecomd')));
$router->addRoute('artykul', new Zend_Controller_Router_Route('artykul.html', array('controller' => 'index', 'action' => 'artykul')));
$router->addRoute('analiza', new Zend_Controller_Router_Route('analiza.html', array('controller' => 'index', 'action' => 'analiza')));
$router->addRoute('archiwum', new Zend_Controller_Router_Route('archiwum.html', array('controller' => 'index', 'action' => 'archiwum')));
$router->addRoute('mapastrony', new Zend_Controller_Router_Route('mapa-strony.html', array('controller' => 'index', 'action' => 'mapastrony')));

// run!
try
{
    $frontController->dispatch();
}
catch( Exception $e )
{
    echo $e;
}
