<?php

require_once 'Zend/Loader.php';

class Bootstrap
{

    public static $frontController = null;

    public static $root = '';
   
    public static function run()
    {
        self::setupEnvironment();
        self::prepare();
        $response = self::$frontController->dispatch();
        self::sendResponse($response);
    }
   
    public static function setupEnvironment()
    {
        error_reporting(E_ALL|E_STRICT);
        ini_set('display_errors', true);
        date_default_timezone_set('Europe/London');
        self::$root = dirname(dirname(__FILE__));
    }
   
    public static function prepare()
    {
        self::setupFrontController();
        self::setupView();
    }
   
    public static function setupFrontController()
    {
        Zend_Loader::registerAutoload();
        self::$frontController = Zend_Controller_Front::getInstance();
        self::$frontController->throwExceptions(true);
        self::$frontController->returnResponse(true);
        self::$frontController->setControllerDirectory(
            self::$root . '/application/controllers'
        );
    }
   
    public static function setupView()
    {
        $view = new Zend_View;
        $view->setEncoding('UTF-8');
        $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer($view);
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
        Zend_Layout::startMvc(
            array(
                'layoutPath' => self::$root . '/application/views/layouts',
                'layout' => 'common'
            )
        );
    }
   
    public static function sendResponse(Zend_Controller_Response_Http $response)
    {
        $response->setHeader('Content-Type', 'text/html; charset=UTF-8', true);
        $response->sendResponse();
    }
}