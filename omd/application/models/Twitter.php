<?php

class Models_Twitter
{
	
	const CACHE_ID = 'twitts';
	
	private $_cacheFrontendOptions;
	private $_cacheBackendOptions;
	
	public function __construct() 
	{
		$this->_cacheFrontendOptions = array(
		   'lifetime' => 900,
		   'automatic_serialization' => true
		);
		
		$this->_cacheBackendOptions = array(
		   'cache_dir' => APPLICATION_PATH . '/cache'
		);
	}
	
	private function _getTwitts()
	{
		$data = array();
		
		$twitterApi = new Phly_Twitter('', '');
		$params = array(
			'id' => 'OptimumMediaOMD',
			'count' => 3
			);

		$response = $twitterApi->statusUserTimeline($params);
		
		for ($i=0; $i < 3; $i++) { 
			$data[] = (string)$response->status[$i]->text;
		}
		
		return $data;
	}
	
	public function getTwitts()
	{
		$cache = Zend_Cache::factory('Core', 'File', $this->_cacheFrontendOptions, $this->_cacheBackendOptions);

		if(!($data = $cache->load(self::CACHE_ID)))
		{
				$data = $this->_getTwitts();
		    $cache->save($data, self::CACHE_ID);
		}
		return $data;
	}
}