<?php

require_once 'Zend/Db/Adapter/Pdo/Mysql.php';

class Message {

	public function __construct() {
		$config = parse_ini_file(dirname(__FILE__) . '/config.ini');
		$this->db = new Zend_Db_Adapter_Pdo_Mysql($config);
	}

	public function getText() {
		return $db->fetchOne('SELECT Message FROM JobTest');
	}
}
