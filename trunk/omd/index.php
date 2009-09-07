<?php
error_reporting(E_ALL|E_STRICT);
date_default_timezone_set('Europe/London');
set_include_path('.'
	. PATH_SEPARATOR . './library'
	. PATH_SEPARATOR . './application/models/'
	. PATH_SEPARATOR . get_include_path()
	. PATH_SEPARATOR . '/home/hhbd/lib/external/'
	. PATH_SEPARATOR . '/home/hhbd/lib/internal/');

include "Zend/Loader.php";

Zend_Loader::loadClass('Zend_Controller_Front');
Zend_Loader::loadClass('Zend_View');

// setup controller
$frontController = Zend_Controller_Front::getInstance();
$frontController->throwExceptions(true);
$frontController->setControllerDirectory('./application/controllers');
$frontController->setBaseUrl('/');

$view = new Zend_View;
$view->setEncoding('UTF-8');

Zend_Loader::loadClass('Zend_Controller_Action_HelperBroker');
Zend_Loader::loadClass('Zend_Controller_Action_Helper_ViewRenderer');
Zend_Loader::loadClass('Zend_Layout');

$viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer($view);
Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
Zend_Layout::startMvc(
	array(
		'layoutPath' => './application/views/layouts',
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

// run!
$frontController->dispatch();